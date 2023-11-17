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
      child: DProvider(
        value: id,

        // Even though it seems unnecessary but this conditional is used for restarting the animation
        child: Builder(
          builder: (context) {
            if (!context.isDesktop) {
              return Column(
                children: [
                  // Display the FAQ introduction section
                  HomeFAQ.introduction(
                      id: id, title: title, subtitle: subtitle),

                  // Display FAQ cards in a wrapped layout
                  Padding(
                    padding: const EdgeInsets.all(Constants.spacing * 2.0),
                    child: Wrap(
                      spacing: Constants.spacing * 2.0,
                      runSpacing: Constants.spacing * 2.0,
                      direction: Axis.horizontal,
                      children: cards.to(HomeFAQ.card),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  // Display the FAQ introduction section
                  Center(
                      child: HomeFAQ.introduction(
                          id: id, title: title, subtitle: subtitle)),

                  // Display FAQ cards in a wrapped layout
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.spacing * 2.0),
                      child: Wrap(
                        spacing: Constants.spacing * 2.0,
                        runSpacing: Constants.spacing * 2.0,
                        direction: Axis.horizontal,
                        children: cards.to(HomeFAQ.card),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  static Widget introduction({
    required String id,
    required String title,
    required String subtitle,
  }) {
    return Builder(
      builder: (context) {
        // Animate the introduction with slide and fade effects
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing,
            vertical: Constants.spacing * 2.0,
          ),
          child: Animate(
            autoPlay: false,
            onInit: Env.controller.animate(id),
            effects: const [
              SlideEffect(
                begin: Offset(0.0, -0.25),
                end: Offset.zero,
                duration: Duration(milliseconds: 750),
              ),
              FadeEffect(
                duration: Duration(milliseconds: 750),
              ),
            ],
            child: MergeSemantics(
              child: Column(
                children: [
                  // Display the title with specific styling
                  Text(
                    title,
                    semanticsLabel: title,
                    textAlign: TextAlign.center,
                    style: context.text.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),

                  // Display the subtitle with specific styling
                  Text(
                    '\n$subtitle',
                    semanticsLabel: subtitle,
                    style: context.text.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget card(int index, CardModel item) {
    return LayoutBuilder(
      builder: (context, constraint) {
        // Calculate the maximum width for the card
        double width = (constraint.maxWidth * 0.5 - (Constants.spacing * 2.0));

        return Animate(
          autoPlay: false,
          onInit: Env.controller.animate(DProvider.of(context)),
          effects: [
            SlideEffect(
              begin: const Offset(0.0, -0.25),
              end: Offset.zero,
              delay: Constants.duration * (index + 1),
              duration: const Duration(milliseconds: 750),
            ),
            FadeEffect(
              delay: Constants.duration * (index + 1),
              duration: const Duration(milliseconds: 750),
            ),
          ],
          child: Container(
            constraints: BoxConstraints(
              maxWidth: width < 240.0 ? constraint.maxWidth : width,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: context.color.background,
              borderRadius: BorderRadius.circular(Constants.spacing * 0.25),
            ),
            child: MergeSemantics(
              child: DTileWrapper(
                (isExpanded) => ExpansionTile(
                  initiallyExpanded: true,
                  trailing: Icon(isExpanded ? Icons.remove : Icons.add),
                  title: Text(
                    item.title,
                    semanticsLabel: item.title,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.color.onBackground,
                    ),
                  ),
                  children: [
                    Container(
                      color: context.color.surface,
                      padding: const EdgeInsets.all(Constants.spacing),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.subtitle,
                              semanticsLabel: item.subtitle,
                              textAlign: TextAlign.start,
                              style: context.text.bodySmall?.copyWith(
                                color: context.color.outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
