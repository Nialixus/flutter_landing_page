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
    return DBuilder(
        data: {
          'label': Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.padding,
                  vertical: Constants.padding * 2.0),
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
                        textAlign: TextAlign.justify)
                  ]))),
          'scroll': SingleChildScrollView(
              padding: const EdgeInsets.all(Constants.padding),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                  children: plans.to((index, item) => Animate(
                      autoPlay: false,
                      onInit: Env.controller.animate(id),
                      effects: [
                        SlideEffect(
                            begin: const Offset(-0.25, 0.0),
                            end: Offset.zero,
                            delay:
                                const Duration(milliseconds: 750) * index * 1.5,
                            duration: const Duration(milliseconds: 750)),
                        FadeEffect(
                            delay:
                                const Duration(milliseconds: 750) * index * 1.5,
                            duration: const Duration(milliseconds: 750))
                      ],
                      child: Container(
                          width: 275.0,
                          padding: const EdgeInsets.all(Constants.padding),
                          margin:
                              const EdgeInsets.only(right: Constants.padding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Constants.padding),
                              color: context.color.background),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(item.title,
                                style: context.text.titleMedium?.copyWith(
                                    color: context.color.onBackground,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                                padding: const EdgeInsets.all(
                                    Constants.padding * 2.0),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('\$',
                                              style: context.text.bodyMedium
                                                  ?.copyWith(
                                                      color: context
                                                          .color.onBackground,
                                                      fontSize: 20.0)),
                                          Text("${item.price}",
                                              style: context.text.titleLarge
                                                  ?.copyWith(
                                                      fontSize: 40.0,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: context
                                                          .color.onBackground,
                                                      height: 1.1)),
                                          Text("/${item.tyoe.name}",
                                              style: context.text.bodyMedium
                                                  ?.copyWith(
                                                      color: context
                                                          .color.onBackground
                                                          .withOpacity(0.5)))
                                        ]))),
                            Flexible(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: item.benefits.split("\n").to(
                                            (index, item) => Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: Constants.padding),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: Constants
                                                                      .padding),
                                                          child: Text("✓",
                                                              style: context
                                                                  .text
                                                                  .bodyMedium
                                                                  ?.copyWith(
                                                                      color: context
                                                                          .color
                                                                          .primary))),
                                                      Expanded(
                                                          child: Text(item,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: context
                                                                  .text
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      color: context
                                                                          .color
                                                                          .onBackground)))
                                                    ])))))),
                            DButton.text(
                                onTap: () {},
                                color: context.color.primary,
                                text: 'Upgrade',
                                style: context.text.bodyMedium
                                    ?.copyWith(color: context.color.background),
                                borderRadius:
                                    BorderRadius.circular(Constants.padding),
                                margin: const EdgeInsets.only(
                                    top: Constants.padding))
                          ]))))))
        },
        builder: (context, data) {
          // Even though it seems unnecessary but this conditional is used for restarting the animation
          if (!context.isDesktop) {
            return Column(children: [
              data.of('label'),
              data.of('scroll'),
            ]);
          } else {
            return Column(children: [
              Center(child: data.of('label')),
              Center(child: data.of('scroll'))
            ]);
          }
        });
  }
}
