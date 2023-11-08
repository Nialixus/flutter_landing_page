part of '../home.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.cards,
  });
  final String id, title, subtitle;
  final List<HomeFeaturesModel> cards;

  @override
  Widget build(BuildContext context) {
    return DBuilder(
        data: {
          "label": Padding(
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
          "items": [
            for (var item in cards)
              Container(
                  width: 300.0,
                  height: 250.0,
                  padding: const EdgeInsets.all(Constants.padding),
                  decoration: BoxDecoration(
                      color: context.color.surface,
                      borderRadius:
                          BorderRadius.circular(Constants.padding * 0.5),
                      boxShadow: [
                        BoxShadow(
                            color: context.color.onBackground.withOpacity(0.1),
                            blurRadius: 10.0)
                      ]),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DImage(
                            source: item.source,
                            size: const Size.square(Constants.padding * 1.5),
                            color: context.color.primary),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: Constants.padding * 0.5,
                                bottom: Constants.padding),
                            child: Text(item.title,
                                style: context.text.bodyMedium?.copyWith(
                                    color: context.color.primary,
                                    fontWeight: FontWeight.bold))),
                        Text(item.subtitle,
                            textAlign: TextAlign.justify,
                            style: context.text.bodySmall
                                ?.copyWith(color: Colors.grey.shade700))
                      ]))
          ]
        },
        builder: (context, data) {
          if (context.isDesktop) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                data.of('label'),
                Container(
                    padding: const EdgeInsets.all(Constants.padding),
                    alignment: Alignment.center,
                    child: Wrap(
                        direction: Axis.horizontal,
                        spacing: Constants.padding,
                        runSpacing: Constants.padding,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: data
                            .of<List<Widget>>("items")
                            .to((index, item) => Animate(
                                autoPlay: false,
                                onInit: Env.controller.animate(id),
                                effects: [
                                  SlideEffect(
                                      begin: const Offset(0.0, -0.25),
                                      end: Offset.zero,
                                      delay: Constants.duration * (index + 1),
                                      duration:
                                          const Duration(milliseconds: 750)),
                                  FadeEffect(
                                      delay: Constants.duration * (index + 1),
                                      duration:
                                          const Duration(milliseconds: 750))
                                ],
                                child: item)))),
                const SizedBox(height: kToolbarHeight)
              ],
            );
          } else {
            final items = data.of<List<Widget>>("items");
            return Container(
                alignment: Alignment.center,
                width: context.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      context.color.primary,
                      context.color.primary.withOpacity(0.0)
                    ])),
                height: (context.height - kToolbarHeight).min(620.0),
                padding: const EdgeInsets.all(Constants.padding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      data.of('label'),
                      Expanded(
                          child: Animate(
                              autoPlay: false,
                              onInit: Env.controller.animate(id),
                              effects: const [
                                ScaleEffect(
                                    begin: Offset(0.75, 0.75),
                                    end: Offset(1.0, 1.0),
                                    delay: Constants.duration,
                                    duration: Duration(milliseconds: 750)),
                                FadeEffect(
                                    delay: Constants.duration,
                                    duration: Duration(milliseconds: 750))
                              ],
                              child: Swiper(
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      SingleChildScrollView(
                                          clipBehavior: Clip.none,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child:
                                              Column(children: [items[index]])),
                                  itemCount: items.length,
                                  autoplay: true,
                                  scrollDirection: context.width >= 560.0
                                      ? Axis.horizontal
                                      : Axis.vertical,
                                  autoplayDelay: 10 * 1000,
                                  layout: SwiperLayout.STACK,
                                  itemWidth: 300.0,
                                  itemHeight: context.height.max(250.0),
                                  control: SwiperControl(
                                      iconNext: Icons.navigate_next_rounded,
                                      iconPrevious:
                                          Icons.navigate_before_rounded,
                                      color: context.color.background))))
                    ]));
          }
        });
  }
}
