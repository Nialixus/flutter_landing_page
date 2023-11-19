import 'package:flutter/material.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:seo/seo.dart';
import 'package:dart_fusion/dart_fusion.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    FutureBuilder(
        future: Env.initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SeoController(
                tree: WidgetTree(context: context),
                child: MaterialApp.router(
                  title: 'Flutter Landing Page',
                  routerConfig: Env.routes,
                  theme: Constants.lightTheme,
                  debugShowCheckedModeBanner: false,
                  scrollBehavior: const DBehavior(),
                ),
              );
            default:
              return const Material(color: Color(0xff0D47A1));
          }
        }),
  );
}
