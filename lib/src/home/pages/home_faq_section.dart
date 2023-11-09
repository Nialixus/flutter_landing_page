part of '../home.dart';

class HomeFAQ extends StatelessWidget {
  const HomeFAQ({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.cards,
  });
  final String id, title, subtitle;
  final List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: context.height - kToolbarHeight,
      ),
      child: DBuilder(
          data: {
            'label': Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.spacing,
                    vertical: Constants.spacing * 2.0),
                child: Animate(
                    autoPlay: false,
                    onInit: Env.controller.animate(id),
                    effects: const [
                      SlideEffect(
                          begin: Offset(0.0, -0.25),
                          end: Offset.zero,
                          duration: Duration(milliseconds: 750)),
                      FadeEffect(duration: Duration(milliseconds: 750))
                    ],
                    child: Column(children: [
                      Text(title,
                          textAlign: TextAlign.center,
                          style: context.text.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900, height: 1.1)),
                      Text('\n$subtitle',
                          style: context.text.bodySmall,
                          textAlign: TextAlign.center)
                    ]))),
          },
          builder: (context, data) {
            return Column(children: [
              data.of('label'),
              Padding(
                padding: const EdgeInsets.all(Constants.spacing * 2.0),
                child: Wrap(
                  spacing: Constants.spacing * 2.0,
                  runSpacing: Constants.spacing * 2.0,
                  direction: Axis.horizontal,
                  children: [
                    for (var item in cards)
                      LayoutBuilder(builder: (context, constraint) {
                        double width = (constraint.maxWidth * 0.5 -
                            (Constants.spacing * 2.0));
                        if (!context.isDesktop) {
                          return Container(
                              constraints: BoxConstraints(
                                  maxWidth: width < 240.0
                                      ? constraint.maxWidth
                                      : width),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: context.color.background,
                                  borderRadius: BorderRadius.circular(
                                      Constants.spacing * 0.25)),
                              child: ExpansionTileWrapper((isExpanded) =>
                                  ExpansionTile(
                                      initiallyExpanded: true,
                                      trailing: Icon(isExpanded
                                          ? Icons.remove
                                          : Icons.add),
                                      title: Text(item.title,
                                          style:
                                              context.text.bodyMedium?.copyWith(
                                            color: context.color.onBackground,
                                          )),
                                      children: [
                                        Container(
                                            color: context.color.surface,
                                            padding: const EdgeInsets.all(
                                                Constants.spacing),
                                            child: Row(children: [
                                              Expanded(
                                                  child: Text(item.subtitle,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: context
                                                          .text.bodySmall
                                                          ?.copyWith(
                                                              color: context
                                                                  .color
                                                                  .outline)))
                                            ]))
                                      ])));
                        } else {
                          return const SizedBox();
                        }
                      })
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
