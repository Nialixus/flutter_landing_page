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
            drawer: NavigationDrawer.of(context),
            body: CustomScrollView(
              slivers: [
                NavigationHeader(backgroundColor: context.color.onBackground),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Background(
                        child: Container(
                          constraints:
                              BoxConstraints(maxHeight: context.height),
                          padding: const EdgeInsets.all(Constants.spacing),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (model.id != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.all(Constants.spacing),
                                  child: Animate(
                                    onComplete: (controller) =>
                                        controller.repeat(),
                                    effects: const [
                                      ShakeEffect(delay: Duration(seconds: 3)),
                                    ],
                                    child: Text(
                                      '${model.id}',
                                      style: context.text.titleLarge?.copyWith(
                                        height: 0.0,
                                        fontSize: 120.0,
                                        fontWeight: FontWeight.w900,
                                        shadows: [
                                          BoxShadow(
                                            color: context.color.onBackground
                                                .withOpacity(0.25),
                                            offset: const Offset(
                                                0.0, Constants.spacing),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Text(
                                (model.id != null ? '\n' : '') + model.title,
                                style: context.text.titleLarge?.copyWith(
                                  fontSize: 30.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '\n${model.subtitle}',
                                      style: context.text.bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Spacer()
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(builder: (context) {
                                    return DButton.text(
                                      margin: const EdgeInsets.all(
                                          Constants.spacing),
                                      onTap: onTap ??
                                          () => Env.controller.onTap(
                                                context,
                                                id: Env.navigations.first.id,
                                              ),
                                      text: 'Back to Home',
                                      borderRadius: BorderRadius.circular(
                                          Constants.spacing * 0.5),
                                      splashColor: context.color.primary
                                          .withOpacity(0.1),
                                      prefix: DImage(
                                        source:
                                            'assets/image/icon_active_home.svg',
                                        size: const Size.square(
                                            Constants.spacing * 0.75),
                                        color: context.color.primary,
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
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: NavigationFooter(),
                ),
              ],
            )));
  }
}
