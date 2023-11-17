part of '../env.dart';

class NavigationController extends ValueNotifier<String> {
  NavigationController(String value) : super(value) {
    scroll.addListener(() {
      final newValue = instance.idPosition();
      if (newValue != null && this.value != newValue) this.value = newValue;
    });
  }

  ScrollController scroll = ScrollController();

  FocusNode node = FocusNode();

  late ScrollToId instance = ScrollToId(scrollController: scroll);

  Future<void> onTap(BuildContext context, {required String id}) async {
    // [1] Get the Scaffold instance
    final scaffold = Scaffold.of(context);

    // [2] Close the Drawer if it was open
    if (scaffold.hasDrawer && scaffold.isDrawerOpen) scaffold.closeDrawer();

    // [3] Check wether current route is home or not
    final isHome = ModalRoute.of(context)?.settings.name == '/';

    // [4] Navigate to the section with the specified ID
    context.go('/?section=$id');

    // [5] Make a delay before calling animation
    if (!isHome) {
      instance.scrollContentsList.clear();
      await Future.delayed(Constants.duration);
    }

    // [6] Scroll to the specified section ID
    if (scroll.hasClients) {
      instance.animateTo(
        id,
        duration: Constants.duration,
        curve: Constants.curve,
      );
    }
  }

  void Function(AnimationController controller) animate(String id) {
    return (controller) {
      // [1] Check wether the animation has been started or not.
      bool isStarted = false;

      // [2] Listen to ScrollToId event.
      scroll.addListener(() {
        // [3] Get position of this trigger.
        int position = Env.navigations.indexWhere((e) => e.id == id).min(0);

        // [4] Get Scroll Position.
        int index = Env.navigations
            .indexWhere((e) => e.id == instance.idPosition())
            .min(0);

        // [5] Check wether this scroll position more than this trigger position or not.
        bool isSection = index >= position;

        if (!isStarted && isSection) {
          try {
            // [6] Starting the animation.
            controller.forward();

            // [7] Condition fultilled and declaring that the animation has been started.
            isStarted = true;

            // [8] Remove ScrollToId listener because we don't need it anymore.
            scroll.removeListener(() {});
          } catch (e) {
            // Do Nothing! 🤫
          }
        }
      });
    };
  }

  void onKey(RawKeyEvent event) {
    moveTo(double position) {
      scroll.animateTo(
        position.limit(0.0, scroll.position.maxScrollExtent),
        duration: Constants.duration * 0.5,
        curve: Constants.curve,
      );
    }

    if (scroll.hasClients && event is RawKeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowDown:
          if (event.isMetaPressed) moveTo(scroll.position.maxScrollExtent);
          if (!event.isMetaPressed) moveTo(scroll.offset + 50);
          break;
        case LogicalKeyboardKey.arrowUp:
          if (event.isMetaPressed) moveTo(0.0);
          if (!event.isMetaPressed) moveTo(scroll.offset - 50);
          break;
        case LogicalKeyboardKey.pageDown:
          moveTo(scroll.offset + 200);
          break;
        case LogicalKeyboardKey.pageUp:
          moveTo(scroll.offset - 200);
          break;
        case LogicalKeyboardKey.home:
          moveTo(0.0);
          break;
        case LogicalKeyboardKey.end:
          moveTo(scroll.position.maxScrollExtent);
          break;
        default:
          break;
      }
    }
  }

  @override
  void dispose() {
    scroll.dispose();
    node.dispose();
    super.dispose();
  }
}
