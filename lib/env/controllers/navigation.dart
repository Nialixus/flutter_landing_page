part of '../env.dart';

class NavigationController extends ValueNotifier<String> {
  NavigationController(String value) : super(value) {
    instance.scrollController?.addListener(() {
      final newValue = instance.idPosition();
      if (newValue != null && this.value != newValue) this.value = newValue;
    });
  }

  ScrollToId instance = ScrollToId(scrollController: ScrollController());

  void onTap(BuildContext context, {required String id}) {
    // [1] Get the Scaffold instance
    final scaffold = Scaffold.of(context);

    // [2] Close the Drawer if open
    if (scaffold.hasDrawer && scaffold.isDrawerOpen) scaffold.closeDrawer();

    // [3] Check if current route is home or not
    if (ModalRoute.of(context)?.settings.name == '/') {
      // [4] Navigate to the section with the specified ID
      context.go('/?section=$id');
    } else {
      // [5] Replace the current route with the specified section ID
      context.go('/?section=$id');
    }

    // [7] Scroll to the specified section ID
    if (instance.scrollController?.hasClients == true &&
        instance.scrollController?.position.hasPixels == true) {
      WidgetsBinding.instance.addPostFrameCallback((x) {
        Future.delayed(x).then((_) => instance.animateTo(
              id,
              duration: Constants.duration,
              curve: Constants.curve,
            ));
      });
    }
  }

  void Function(AnimationController controller) animate(String id) {
    return (controller) {
      // [1] Check wether the animation has been started or not.
      bool isStarted = false;

      // [2] Listen to ScrollToId event.
      instance.scrollController?.addListener(() {
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
            instance.scrollController?.removeListener(() {});
          } catch (e) {
            // Do Nothing! 🤫
          }
        }
      });
    };
  }

  @override
  void dispose() {
    instance.scrollController?.dispose();
    super.dispose();
  }
}
