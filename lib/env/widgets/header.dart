part of '../env.dart';

class Header extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
        color: Color.lerp(
            context.color.primary.withOpacity(shrinkOffset / kToolbarHeight),
            context.color.onBackground,
            shrinkOffset / kToolbarHeight),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            left: !context.isDesktop ? 0.0 : Constants.padding,
            right: Constants.padding),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          if (!context.isDesktop)
            DButton(
                onTap: () {},
                padding: const EdgeInsets.all(Constants.padding * 0.75),
                color: Colors.transparent,
                child: Icon(Icons.menu, color: context.color.background)),
          Text('🎉  FLUTTER',
              style: context.text.titleLarge?.copyWith(
                  color: context.color.background,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0)),
          context.isDesktop
              ? Expanded(
                  child: Center(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var navigation in Env.navigations)
                                  DButton.text(
                                      text: navigation.name,
                                      color: Colors.transparent,
                                      style: context.text.bodyMedium?.copyWith(
                                          color: context.color.background),
                                      onTap: () => Env.controller.onTap(
                                            context,
                                            id: navigation.id,
                                          ))
                              ]))))
              : const Spacer(),
          DButton.text(
              text: 'Get Started',
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              borderRadius: BorderRadius.circular(20.0),
              style: context.text.bodyMedium?.copyWith(
                  color: context.color.primary, fontWeight: FontWeight.w600),
              onTap: () {})
        ]));
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      this != oldDelegate;
}
