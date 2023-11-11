import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_fusion/dart_fusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_landing_page/env/widgets/change_notifier_builder.dart';
import 'package:flutter_landing_page/src/home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:url_launcher/url_launcher.dart';

part 'assets/routes.dart';
part 'assets/constants.dart';
part 'controllers/navigation.dart';
part 'models/navigation.dart';
part 'models/card.dart';
part 'models/error.dart';
part 'widgets/background.dart';
part 'widgets/drawer.dart';
part 'widgets/header.dart';
part 'widgets/footer.dart';
part 'widgets/error.dart';

class Env {
  static GoRouter routes = GoRouter(
    routes: [Routes.home],
    initialLocation: Routes.home.path,
    errorBuilder: Routes.error.builder,
  );

  static const List<NavigationModel> navigations = [
    NavigationModel.starter,
    NavigationModel.features,
    NavigationModel.pricing,
    NavigationModel.faq
  ];

  static NavigationController controller = NavigationController(
    navigations.first.id,
  );
}
