part of '../home.dart';

class HomeStarter extends StatelessWidget {
  const HomeStarter({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
  });
  final String id, title, subtitle;

  @override
  Widget build(context) {
    return SizedBox(
      width: context.width,
      height: context.height - kToolbarHeight,
      child: DBuilder(
        data: {
          "starter": [
            IntrinsicWidth(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(title,
                      style: context.text.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w900, height: 1.1),
                      textAlign: TextAlign.left),
                  Text('\n$subtitle',
                      style: context.text.bodySmall,
                      textAlign: TextAlign.justify)
                ])),
            Padding(
                padding: const EdgeInsets.all(Constants.padding),
                child: Wrap(
                    runSpacing: Constants.padding * 0.5,
                    spacing: Constants.padding * 0.5,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      DTextArea(
                          isDense: false,
                          textAlign: TextAlign.start,
                          cursorColor: context.color.background,
                          borderRadius:
                              BorderRadius.circular(Constants.padding * 0.5),
                          borderSideIdle: BorderSide.none,
                          backgroundColor:
                              context.color.onBackground.withOpacity(0.5),
                          hintText: 'Enter Your Email Adress              ',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: Constants.padding),
                          textStyle: context.text.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.color.surface),
                          hintStyle: context.text.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.color.surface.withOpacity(0.5)),
                          borderSideActive: BorderSide(
                            color: context.color.background.withOpacity(0.75),
                          ),
                          placeholder: DButton.text(
                              text: 'Enter Your Email Adress              ',
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Constants.padding,
                                  vertical: Constants.padding * 0.75),
                              style: context.text.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              onTap: () {})),
                      DButton.text(
                          onTap: () {},
                          text: 'Join Waitlist',
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.padding,
                              vertical: Constants.padding * 0.7),
                          style: context.text.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.color.primary,
                          ),
                          borderRadius:
                              BorderRadius.circular(Constants.padding * 0.5))
                    ]))
          ],
          "illustration": Animate(
              effects: const [
                SlideEffect(
                    begin: Offset(0.0, -0.25),
                    end: Offset.zero,
                    delay: Constants.duration,
                    duration: Duration(milliseconds: 750)),
                FadeEffect(
                    delay: Constants.duration,
                    duration: Duration(milliseconds: 750))
              ],
              child: Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(3.14 * 0.15)
                    ..scale(1.25),
                  alignment: Alignment.center,
                  child: const DImage(source: 'assets/image/thumbnail.png')))
        },
        builder: (context, data) {
          if (context.isDesktop) {
            return Padding(
              padding: const EdgeInsets.all(Constants.padding),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Animate(
                    effects: const [
                      SlideEffect(
                        begin: Offset(0.0, 0.25),
                        end: Offset.zero,
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      ),
                      FadeEffect(
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      )
                    ],
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: data.of('starter')),
                  )),
                  const SizedBox(width: Constants.padding),
                  Expanded(child: data.of('illustration')),
                ],
              ),
            );
          } else {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                data.of('illustration'),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        context.color.primary,
                        context.color.primary,
                        Colors.transparent
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(Constants.padding),
                  child: Animate(
                    effects: const [
                      SlideEffect(
                        begin: Offset(0.0, 0.25),
                        end: Offset.zero,
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      ),
                      FadeEffect(
                        delay: Constants.duration,
                        duration: Duration(milliseconds: 750),
                      )
                    ],
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: data.of('starter'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
