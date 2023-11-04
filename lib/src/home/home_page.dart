import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

part 'home_faq_section.dart';
part 'home_features_section.dart';
part 'home_pricing_section.dart';
part 'home_starter_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Background(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              // drawer: const AppDrawer(),
              body: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: Header(),
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: InteractiveScrollViewer(
                        scrollToId: Env.controller.instance,
                        scrollDirection: Axis.vertical,
                        children:
                            Env.navigations.to((index, item) => ScrollContent(
                                id: item.id,
                                child: index == 0
                                    ? HomeStarterSection(
                                        id: item.id,
                                        title:
                                            "Explore Key Features or Benefits",
                                        subtitle:
                                            "We've Solved Problem with Your Solution"
                                            " - Making Your Life Easier. Get Ready for Our Upcoming Launch"
                                            " - Something Amazing Awaits. Stay Informed.",
                                      )
                                    : Container(
                                        height: context.height,
                                        color: Colors.red,
                                      )))),
                  ),
                ],
              ))),
    );
  }
}
