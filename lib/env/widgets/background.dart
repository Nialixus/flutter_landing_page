part of '../env.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    this.opacity = 0.25,
    this.backgroundColor,
    this.imageColor,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.source = 'assets/image/background.png',
    required this.child,
  }) : builder = null;

  const Background.builder(
    this.builder, {
    super.key,
    this.opacity = 0.25,
    this.child = const SizedBox(),
    this.backgroundColor,
  })  : imageColor = null,
        source = '',
        fit = BoxFit.cover,
        alignment = Alignment.center,
        assert(builder != null);
  final Widget child;
  final Widget Function(BuildContext context, Widget child)? builder;
  final double opacity;
  final Color? backgroundColor, imageColor;
  final String source;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ColoredBox(color: backgroundColor ?? context.color.primary)),
        Positioned.fill(
            child: Opacity(
                opacity: opacity,
                child: builder != null
                    ? Builder(builder: (context) => builder!(context, child))
                    : DImage(
                        alignment: alignment,
                        source: source,
                        fit: fit,
                        colorBlendMode: BlendMode.hardLight,
                        color: imageColor ?? context.color.primary))),
        child
      ],
    );
  }

  static Background parallax({
    required Widget child,
  }) {
    return Background.builder(
        (_, __) => ChangeNotifierBuilder(
            value: Env.controller.instance.scrollController,
            builder: (context, value, child) {
              double position = 0.0;

              if (value != null && value.hasClients) {
                double maxScrollExtent = value.position.maxScrollExtent;
                double offset = value.offset;

                if (maxScrollExtent > 0) {
                  position = offset / maxScrollExtent * 2.0;
                }
              }
              return RepaintBoundary(
                child: DImage(
                    alignment: Alignment(0.0, -1.0 + position),
                    source: 'assets/image/background.png',
                    fit: BoxFit.fitWidth,
                    colorBlendMode: BlendMode.hardLight,
                    color: context.color.primary),
              );
            }),
        child: child);
  }
}
