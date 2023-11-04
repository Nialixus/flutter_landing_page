part of '../env.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ColoredBox(color: context.color.primary)),
        Positioned.fill(
            child: Opacity(
                opacity: 0.35,
                child: DImage(
                    source: 'assets/image/background.jpeg',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.hardLight,
                    color: context.color.primary))),
        child
      ],
    );
  }
}
