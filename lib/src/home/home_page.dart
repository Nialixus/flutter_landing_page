import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:go_router/go_router.dart';

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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('FLUTTER',
                    style: context.text.titleLarge?.copyWith(
                        color: context.color.background,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0)),
                const Spacer(),
                for (var navigation in Env.navigations)
                  DButton.text(
                    text: navigation.name,
                    color: Colors.transparent,
                    style: context.text.bodyMedium
                        ?.copyWith(color: context.color.background),
                    onTap: () => context.go('/?section=${navigation.id}'),
                  )
              ],
            ),
          ),
        ),
        backgroundColor: context.color.primary,
        body: Background(child: Text('Test')),
        // drawer: const AppDrawer(),
        // body: InteractiveScrollViewer(
        //     scrollToId: scroll,
        //     scrollDirection: Axis.vertical,
        //     children: [
        //       StarterPage(scroll: scroll),
        //       BenefitsPage(scroll: scroll),
        //       PricingPage(scroll: scroll),
        //     ].to((index, child) => ScrollContent(
        //           id: AppPageModel.home.sections[index].id,
        //           child: child,
        //         ))
        //       ..add(ScrollContent(
        //         id: AppSectionModel.footer.id,
        //         child: const AppFooter(),
        //       )))
      ),
    );
  }
}
