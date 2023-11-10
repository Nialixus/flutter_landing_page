part of '../home.dart';

class HomePricing extends StatelessWidget {
  const HomePricing({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.plans,
  });
  final String id, title, subtitle;
  final List<HomePricingModel> plans;

  @override
  Widget build(BuildContext context) {
    return ValueProvider(
      value: id,
      child: Builder(
        // Even though it seems unnecessary but this conditional is used for restarting the animation
        builder: (context) {
          if (!context.isDesktop) {
            return Column(
              children: [
                // Display label
                HomePricing.introduction(
                    id: id, title: title, subtitle: subtitle),

                // Display cards
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: context.height * 0.75),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(Constants.spacing),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: plans.to(HomePricing.card),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                // Display label with different tree
                Center(
                    child: HomePricing.introduction(
                        id: id, title: title, subtitle: subtitle)),

                // Display card with different tree
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    constraints:
                        BoxConstraints(minHeight: context.height * 0.75),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(Constants.spacing),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: plans.to(HomePricing.card),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
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
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing,
            vertical: Constants.spacing * 2.0,
          ),
          child: Animate(
            autoPlay: false,
            onInit: Env.controller.animate(id),
            effects: const [
              // Slide in animation effect
              SlideEffect(
                begin: Offset(0.0, -0.25),
                end: Offset.zero,
                duration: Duration(milliseconds: 750),
              ),

              // Fade in animation effect
              FadeEffect(
                duration: Duration(milliseconds: 750),
              ),
            ],
            child: Column(
              children: [
                // Display the title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),

                // Display the subtitle
                Text(
                  '\n$subtitle',
                  style: context.text.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget card(int index, HomePricingModel item) {
    return Builder(
      builder: (context) {
        return Animate(
          autoPlay: false,
          onInit: Env.controller.animate(ValueProvider.of(context)),
          effects: [
            // Slide in animation effect
            SlideEffect(
              begin: const Offset(-0.25, 0.0),
              end: Offset.zero,
              delay: const Duration(milliseconds: 750) * index * 1.5,
              duration: const Duration(milliseconds: 750),
            ),

            // Fade in animation effect
            FadeEffect(
              delay: const Duration(milliseconds: 750) * index * 1.5,
              duration: const Duration(milliseconds: 750),
            ),
          ],
          child: Container(
            width: 275.0,
            padding: const EdgeInsets.all(Constants.spacing),
            margin: const EdgeInsets.only(right: Constants.spacing),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.spacing),
              color: context.color.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Display item title
                Text(
                  item.title,
                  style: context.text.titleMedium?.copyWith(
                    color: context.color.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Display pricing label
                Padding(
                  padding: const EdgeInsets.all(Constants.spacing * 2.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Display price currency
                        Text(
                          '\$',
                          style: context.text.bodyMedium?.copyWith(
                            color: context.color.onBackground,
                            fontSize: 20.0,
                          ),
                        ),

                        // Display the price
                        Text(
                          "${item.price}",
                          style: context.text.titleLarge?.copyWith(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            color: context.color.onBackground,
                            height: 1.1,
                          ),
                        ),

                        // Displa the period
                        Text(
                          "/${item.type.name}",
                          style: context.text.bodyMedium?.copyWith(
                            color: context.color.onBackground.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Display card list
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: item.benefits.split("\n").to(
                            (index, item) => Padding(
                              padding: const EdgeInsets.only(
                                  bottom: Constants.spacing),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Display benefit checkmark
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: Constants.spacing),
                                    child: Text(
                                      "✓",
                                      style: context.text.bodyMedium?.copyWith(
                                        color: context.color.primary,
                                      ),
                                    ),
                                  ),

                                  // Display benefit description
                                  Expanded(
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.justify,
                                      style: context.text.bodySmall?.copyWith(
                                        color: context.color.onBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                ),

                // Display Upgrade button
                DButton.text(
                  onTap: () {},
                  color: context.color.primary,
                  text: 'Upgrade',
                  style: context.text.bodyMedium?.copyWith(
                    color: context.color.background,
                  ),
                  borderRadius: BorderRadius.circular(Constants.spacing),
                  margin: const EdgeInsets.only(top: Constants.spacing),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
