part of '../env.dart';

class NavDrawer extends Drawer {
  const NavDrawer.of(this.context, {super.key});
  final BuildContext context;

  @override
  double? get width => Constants.drawer;

  @override
  Color? get backgroundColor => context.color.primary;

  @override
  ShapeBorder? get shape => const RoundedRectangleBorder();

  @override
  Widget? get child => Background(
      opacity: 0.1,
      fit: BoxFit.none,
      alignment: Alignment.topLeft,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.padding,
            bottom: Constants.padding * 3.0,
          ),
          child: Text('🎉  FLUTTER',
              style: context.text.titleLarge?.copyWith(
                  color: context.color.background,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0)),
        ),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: Env.controller,
                builder: (context, value, _) => SingleChildScrollView(child:
                        Column(children: Env.navigations.to((index, item) {
                      final isSelected = value == item.id;
                      return DButton.text(
                        text: item.name,
                        mainAxisSize: MainAxisSize.max,
                        color: context.color.background
                            .withOpacity(isSelected ? 0.25 : 0.0),
                        padding: const EdgeInsets.all(Constants.padding),
                        margin: const EdgeInsets.only(
                          left: Constants.padding * 0.5,
                          bottom: Constants.padding * 0.5,
                        ),
                        style: context.text.bodyMedium?.copyWith(
                            color: context.color.background
                                .withOpacity(isSelected ? 1.0 : 0.5),
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.normal),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Constants.padding * 0.25),
                            bottomLeft:
                                Radius.circular(Constants.padding * 0.25)),
                        prefix: Padding(
                            padding: const EdgeInsets.only(
                              right: Constants.padding * 0.5,
                            ),
                            child: DImage(
                              source: isSelected
                                  ? item.activeIcon
                                  : item.inactiveIcon,
                              color: context.color.background,
                              size: const Size.square(Constants.padding),
                            )),
                        onTap: () => Env.controller.onTap(context, id: item.id),
                      );
                    })))))
      ]));
}
