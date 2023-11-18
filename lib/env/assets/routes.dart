part of '../env.dart';

class Routes {
  static GoRoute home = GoRoute(
      path: '/',
      builder: (context, state) {
        if (kIsWeb) {
          MetaSEO()
            ..ogTitle(ogTitle: 'Flutter Landing Page')
            ..description(
                description: 'A responsive landing page template for flutter. '
                    'Perfect for showcasing your product or service with a clean '
                    'lead-in, FAQs, pricing, and key features.')
            ..keywords(
                keywords: 'Flutter, Landing Page, Responsive, Multi-Platform, '
                    'Template, Flutter Landing Page, Flutter Template')
            ..author(author: 'Louis Wiwawan')
            ..ogDescription(
                ogDescription:
                    'A responsive landing page template for flutter. '
                    'Perfect for showcasing your product or service with a clean '
                    'lead-in, FAQs, pricing, and key features.')
            ..ogImage(
                ogImage: 'https://user-images.githubusercontent.com/'
                    '45191605/282370539-0cd5e94c-1a31-447a-b7c4-fdba6a58f0f9.png')
            ..nameContent(name: 'twitter:site', content: '@wawan_ariwijaya');
        }

        FocusScope.of(context).requestFocus(Env.controller.node);

        return DLogWidget(
          'http://localhost${state.uri}',
          child: const HomePage(),
        );
      });

  static GoRoute error = GoRoute(
      path: '/error',
      builder: (context, state) {
        if (kIsWeb) {
          MetaSEO()
            ..ogTitle(ogTitle: 'Flutter Landing Page : Page Not Found')
            ..description(description: 'An example of error page in flutter.')
            ..keywords(
                keywords: 'Flutter, Error Page, '
                    'Template, 404, Page Not Found')
            ..author(author: 'Louis Wiwawan')
            ..ogDescription(
                ogDescription: 'An example of error page in flutter.')
            ..ogImage(
                ogImage: 'https://user-images.githubusercontent.com/'
                    '45191605/283660084-c7bd8b9d-34b1-49e7-88e3-7c52a2003532.png')
            ..nameContent(name: 'twitter:site', content: '@wawan_ariwijaya');
        }
        return DLogWidget(
          'http://localhost${state.uri}',
          child: ErrorPage(model: ErrorModel.error404),
        );
      });
}
