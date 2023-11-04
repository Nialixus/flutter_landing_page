import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page/src/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

part 'assets/routes.dart';
part 'assets/constants.dart';
part 'controllers/navigation.dart';
part 'models/navigation.dart';
part 'widgets/background.dart';
part 'widgets/header.dart';

class Env {
  static GoRouter routes = GoRouter(
    routes: [Routes.home],
    initialLocation: Routes.home.path,
  );

  static List<NavigationModel> navigations = [
    NavigationModel.starter,
    NavigationModel.features,
    NavigationModel.pricing,
    NavigationModel.faq
  ];

  static NavigationController controller = NavigationController(
    NavigationModel.starter.id,
  );
}
