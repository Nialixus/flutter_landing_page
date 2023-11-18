part of '../env.dart';

class Routes {
  static GoRoute home = GoRoute(
      path: '/',
      builder: (context, state) {
        FocusScope.of(context).requestFocus(Env.controller.node);

        return DLogWidget(
          'http://localhost${state.uri}',
          child: Seo.head(tags: const [
            MetaTag(name: 'title', content: 'Flutter Landing Page'),
            LinkTag(
              rel: 'canonical',
              href: 'https://nialixus-landing-page.web.app',
            )
          ], child: const HomePage()),
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
          child: Seo.head(
            tags: [
              const MetaTag(
                name: 'title',
                content: 'Flutter Landing Page : Page Not Found',
              ),
              LinkTag(
                rel: 'canonical',
                href: 'https://nialixus-landing-page.web.app${state.uri}',
              )
            ],
            child: ErrorPage(model: ErrorModel.error404),
          ),
        );
      });
}
