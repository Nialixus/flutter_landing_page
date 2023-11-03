import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page/src/home/home_page.dart';
import 'package:go_router/go_router.dart';

part 'assets/routes.dart';
part 'assets/constants.dart';
part 'models/navigation.dart';
part 'widgets/background.dart';
part 'widgets/header.dart';

class Env {
  static GoRouter routes = GoRouter(
    routes: [Routes.home],
    initialLocation: Routes.home.path,
  );

  static List<Navigation> navigations = [
    Navigation.starter,
    Navigation.features,
    Navigation.pricing,
    Navigation.faq
  ];
}
