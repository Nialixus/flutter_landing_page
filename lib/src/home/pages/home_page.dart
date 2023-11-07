part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        child: Background.parallax(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: NavDrawer.of(context),
                body: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) =>
                        const [Header()],
                    body: InteractiveScrollViewer(
                        scrollToId: Env.controller.instance,
                        scrollDirection: Axis.vertical,
                        children:
                            Env.navigations.to((index, item) => ScrollContent(
                                id: item.id,
                                child: index == 0
                                    ? HomeStarter(
                                        id: item.id,
                                        title:
                                            "Explore Key Features or Benefits",
                                        subtitle:
                                            "We've Solved Problem with Your Solution"
                                            " - Making Your Life Easier. Get Ready for Our Upcoming Launch"
                                            " - Something Amazing Awaits. Stay Informed.",
                                      )
                                    : index == 1
                                        ? HomeFeatures(
                                            id: item.id,
                                            title: 'Key Features',
                                            subtitle: 'Explore Why Our Product'
                                                ' is the Ideal Solution for Your Needs',
                                            cards: const [
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_faq.svg',
                                                title:
                                                    "Discover the World's Wonders",
                                                subtitle:
                                                    'Embark on a mesmerizing journey to '
                                                    'breathtaking destinations and uncover the '
                                                    'hidden gems that make our planet truly extraordinary.',
                                              ),
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_features.svg',
                                                title:
                                                    'Unleash Your Creativity',
                                                subtitle:
                                                    'Ignite your creative spark and let your '
                                                    'imagination run wild with our vast collection '
                                                    'of inspiring content, designed to fuel your artistic passions.',
                                              ),
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_pricing.svg',
                                                title:
                                                    'Elevate Your Taste Buds',
                                                subtitle:
                                                    'Indulge in a delectable culinary journey '
                                                    'that tantalizes your palate, as we guide you '
                                                    'through a world of flavors and culinary adventures.',
                                              ),
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_faq.svg',
                                                title:
                                                    'Master Your Fitness Journey',
                                                subtitle:
                                                    'Take control of your health and wellness '
                                                    'goals with our expert guidance, tailored '
                                                    'workouts, and nutrition tips to help you '
                                                    'achieve the best version of yourself.',
                                              ),
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_features.svg',
                                                title:
                                                    'Unlock Adventure Awaits',
                                                subtitle:
                                                    'Embark on thrilling adventures and create '
                                                    'unforgettable moments as we guide you through '
                                                    'an exciting world of experiences, from '
                                                    'adrenaline-pumping escapades to serene getaways.',
                                              ),
                                              HomeFeaturesModel(
                                                source:
                                                    'assets/image/icon_inactive_pricing.svg',
                                                title:
                                                    'Stay Informed and Inspired',
                                                subtitle:
                                                    'Get the latest news, insights, and motivation '
                                                    'from our team of experts and thought leaders. '
                                                    'Stay informed, stay inspired, and stay ahead of the curve.',
                                              )
                                            ],
                                          )
                                        : Container(
                                            height: context.height,
                                            color: Colors.transparent,
                                          ))))))));
  }
}
