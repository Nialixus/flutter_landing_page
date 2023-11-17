part of '../env.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.model,
    this.onTap,
    this.additional,
  });
  final ErrorModel model;
  final VoidCallback? onTap;
  final Widget? additional;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: context.color.primary,
        appBar: NavigationHeader(
          backgroundColor: context.color.onBackground,
          selectionColor: context.color.background.withOpacity(0.35),
        ),
        drawer: NavigationDrawer.of(context),
        body: ListView(
          children: [
            Background(
              child: Container(
                height: context.height,
                constraints: const BoxConstraints(minHeight: 550.0),
                padding: const EdgeInsets.all(Constants.spacing),
                child: MergeSemantics(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (model.id != null)
                        Padding(
                          padding: const EdgeInsets.all(Constants.spacing),
                          child: Animate(
                            onComplete: (controller) => controller.repeat(),
                            effects: const [
                              ShakeEffect(delay: Duration(seconds: 3)),
                            ],
                            child: Seo.text(
                              text: model.id.toString(),
                              style: TextTagStyle.h1,
                              child: AutoSizeText(
                                '${model.id}',
                                maxLines: 1,
                                semanticsLabel: '${model.id} Error Code',
                                style: context.text.titleLarge?.copyWith(
                                  height: 0.0,
                                  fontSize: 120.0,
                                  fontWeight: FontWeight.w900,
                                  shadows: [
                                    BoxShadow(
                                      color: context.color.onBackground
                                          .withOpacity(0.25),
                                      offset:
                                          const Offset(0.0, Constants.spacing),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      Seo.text(
                        text: model.title,
                        style: TextTagStyle.h2,
                        child: Text(
                          (model.id != null ? '\n' : '') + model.title,
                          semanticsLabel: model.title,
                          textAlign: TextAlign.center,
                          style: context.text.titleLarge?.copyWith(
                            fontSize: 30.0,
                            height: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 3,
                            child: Seo.text(
                              text: model.subtitle,
                              style: TextTagStyle.p,
                              child: Text(
                                '\n${model.subtitle}',
                                semanticsLabel: model.subtitle,
                                style: context.text.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(builder: (context) {
                            return Semantics(
                              label: 'Back to Flutter Landing Page',
                              link: true,
                              child: Seo.link(
                                anchor: 'Back to Home',
                                href: '/',
                                child: DButton.text(
                                  margin:
                                      const EdgeInsets.all(Constants.spacing),
                                  onTap: onTap ??
                                      () => Env.controller.onTap(
                                            context,
                                            id: Env.navigations.first.id,
                                          ),
                                  text: 'Back to Home',
                                  borderRadius: BorderRadius.circular(
                                      Constants.spacing * 0.5),
                                  splashColor:
                                      context.color.primary.withOpacity(0.1),
                                  prefix: DImage(
                                    source: 'assets/image/icon_active_home.svg',
                                    size: const Size.square(
                                        Constants.spacing * 0.75),
                                    color: context.color.primary,
                                  ),
                                ),
                              ),
                            );
                          }),
                          if (additional != null) additional!
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const NavigationFooter(),
          ],
        ),
      ),
    );
  }
}
