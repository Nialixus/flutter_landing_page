part of '../env.dart';

class Routes {
  static GoRoute home = GoRoute(
    path: '/',
    builder: (context, state) => DLogWidget(
      'http://localhost${state.uri}',
      child: const HomePage(),
    ),
  );
}
