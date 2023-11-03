import 'package:flutter/material.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:dart_fusion/dart_fusion.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    MaterialApp.router(
      title: 'Flutter Landing Page',
      routerConfig: Env.routes,
      theme: Constants.lightTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const DBehavior(),
    ),
  );
}
