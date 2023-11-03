part of '../env.dart';

class Routes {
  static GoRoute home = GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  );
}
