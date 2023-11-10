part of '../env.dart';

class Routes {
  static GoRoute home = GoRoute(
    path: '/',
    builder: (context, state) => DLogWidget(
      'http://localhost${state.uri}',
      child: const HomePage(),
    ),
  );

  static GoRoute error = GoRoute(
    path: '/error',
    builder: (context, state) => DLogWidget(
      'http://localhost${state.uri}',
      child: ErrorPage(model: ErrorModel.error404),
    ),
  );
}
