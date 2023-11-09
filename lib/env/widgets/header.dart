part of '../env.dart';

class NavigationHeader extends SliverAppBar {
  const NavigationHeader({super.key});

  @override
  bool get automaticallyImplyLeading => false;

  @override
  bool get pinned => true;

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  Widget? get flexibleSpace => Builder(builder: (context) {
        return ChangeNotifierBuilder(
            value: Env.controller.instance.scrollController!,
            builder: (context, value, child) {
              double progress =
                  value.offset.max(kToolbarHeight) / kToolbarHeight;
              return Theme(
                data: context.theme.copyWith(
                    textSelectionTheme: context.theme.textSelectionTheme
                        .copyWith(
                            selectionColor: Color.lerp(
                                    context.color.onBackground,
                                    context.color.background,
                                    progress)
                                ?.withOpacity(0.25))),
                child: Container(
                    color: Color.lerp(
                        context.color.primary.withOpacity(progress),
                        context.color.onBackground,
                        progress),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: !context.isDesktop ? 0.0 : Constants.spacing,
                        right: Constants.spacing),
                    child: child),
              );
            },
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              if (!context.isDesktop)
                DButton(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    padding: const EdgeInsets.all(Constants.spacing * 0.75),
                    color: Colors.transparent,
                    child: Icon(Icons.menu, color: context.color.background)),
              Text('🎉  FLUTTER',
                  style: context.text.titleLarge?.copyWith(
                      color: context.color.background,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0)),
              context.isDesktop
                  ? Expanded(
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          for (var navigation in Env.navigations)
                            DButton.text(
                                text: navigation.name,
                                color: Colors.transparent,
                                style: context.text.bodyMedium
                                    ?.copyWith(color: context.color.background),
                                onTap: () => Env.controller.onTap(
                                      context,
                                      id: navigation.id,
                                    ))
                        ]))
                  : const Spacer(),
              Theme(
                data: context.theme,
                child: DButton.text(
                    text: 'Get Started',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    borderRadius: BorderRadius.circular(20.0),
                    style: context.text.bodyMedium?.copyWith(
                        color: context.color.primary,
                        fontWeight: FontWeight.w600),
                    onTap: () {}),
              )
            ]));
      });
}
