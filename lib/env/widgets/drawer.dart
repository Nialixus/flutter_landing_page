part of '../env.dart';

class NavigationDrawer extends Drawer {
  const NavigationDrawer.of(this.context, {super.key});
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
            top: Constants.spacing,
            bottom: Constants.spacing * 3.0,
          ),
          child: NavigationHeader.logo(),
        ),
        Expanded(
            child: ValueListenableBuilder(
                valueListenable: Env.controller,
                builder: (context, value, _) => SingleChildScrollView(child:
                        Column(children: Env.navigations.to((index, item) {
                      final isSelected = value == item.id;
                      return Semantics(
                        label: item.name,
                        link: true,
                        child: Seo.link(
                          anchor: item.name,
                          href: '/?section=${item.id}',
                          child: DButton.text(
                            text: item.name,
                            mainAxisSize: MainAxisSize.max,
                            color: context.color.background
                                .withOpacity(isSelected ? 0.25 : 0.0),
                            padding: const EdgeInsets.all(Constants.spacing),
                            margin: const EdgeInsets.only(
                              left: Constants.spacing * 0.5,
                              bottom: Constants.spacing * 0.5,
                            ),
                            style: context.text.bodyMedium?.copyWith(
                                color: context.color.background
                                    .withOpacity(isSelected ? 1.0 : 0.5),
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.normal),
                            borderRadius: const BorderRadius.only(
                                topLeft:
                                    Radius.circular(Constants.spacing * 0.25),
                                bottomLeft:
                                    Radius.circular(Constants.spacing * 0.25)),
                            prefix: Padding(
                                padding: const EdgeInsets.only(
                                  right: Constants.spacing * 0.5,
                                ),
                                child: DImage(
                                  source: isSelected
                                      ? item.activeIcon
                                      : item.inactiveIcon,
                                  color: context.color.background,
                                  size: const Size.square(Constants.spacing),
                                )),
                            onTap: () =>
                                Env.controller.onTap(context, id: item.id),
                          ),
                        ),
                      );
                    })))))
      ]));
}
