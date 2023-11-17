part of '../env.dart';

class NavigationHeader extends AppBar {
  NavigationHeader({
    super.key,
    super.backgroundColor = Colors.transparent,
    this.selectionColor,
  });

  final Color? selectionColor;

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get flexibleSpace => Hero(
        tag: '#Header',
        child: Builder(builder: (context) {
          return DChangeBuilder(
            value: Env.controller.scroll,
            builder: (context, value, child) {
              // Calculate the scroll progress
              double position() {
                if (value.hasClients) return value.offset;
                return 0.0;
              }

              double progress = position().max(kToolbarHeight) / kToolbarHeight;

              return Theme(
                data: context.theme.copyWith(
                  textSelectionTheme: context.theme.textSelectionTheme.copyWith(
                    selectionColor: selectionColor ??
                        Color.lerp(
                          context.color.onBackground,
                          context.color.background,
                          progress,
                        )?.withOpacity(0.25),
                  ),
                ),
                child: Container(
                  color: Color.lerp(
                    context.color.primary.withOpacity(progress),
                    context.color.onBackground,
                    progress,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    left: !context.isDesktop ? 0.0 : Constants.spacing,
                    right: Constants.spacing,
                  ),
                  child: child,
                ),
              );
            },
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              if (!context.isDesktop)
                Semantics(
                  label: 'Open Menu',
                  link: true,
                  child: DButton(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    padding: const EdgeInsets.all(Constants.spacing * 0.75),
                    color: Colors.transparent,
                    child: Icon(Icons.menu, color: context.color.background),
                  ),
                ),
              NavigationHeader.logo(),
              context.isDesktop
                  ? Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Display navigation buttons for desktop
                          for (var navigation in Env.navigations)
                            Semantics(
                              label: navigation.name,
                              link: true,
                              child: Seo.link(
                                anchor: navigation.name,
                                href: '/?section=${navigation.id}',
                                child: DButton.text(
                                  text: navigation.name,
                                  color: Colors.transparent,
                                  style: context.text.bodyMedium?.copyWith(
                                    color: context.color.background,
                                  ),
                                  onTap: () => Env.controller.onTap(
                                    context,
                                    id: navigation.id,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : const Spacer(),
              Theme(
                data: context.theme,
                child: Semantics(
                  label: 'Go to dashboard',
                  link: true,
                  child: Seo.link(
                    anchor: 'Get Started',
                    href: '/dashboard',
                    child: DButton.text(
                      text: 'Get Started',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      borderRadius: BorderRadius.circular(20.0),
                      style: context.text.bodyMedium?.copyWith(
                        color: context.color.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () => context.go('/dashboard'),
                    ),
                  ),
                ),
              )
            ]),
          );
        }),
      );

  static Widget logo() {
    return Builder(builder: (context) {
      return Seo.text(
        text: '🎉  FLUTTER',
        style: TextTagStyle.h1,
        child: Text(
          // Your logo
          '🎉  FLUTTER', semanticsLabel: 'Flutter Landing Page Logo',
          style: context.text.titleLarge?.copyWith(
            color: context.color.background,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
      );
    });
  }
}
