part of '../env.dart';

class NavigationFooter extends StatelessWidget {
  const NavigationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: context.color.background.withOpacity(0.15),
        ),
      ),
      child: Container(
        color: context.color.onBackground,
        padding: const EdgeInsets.all(Constants.spacing),
        constraints: BoxConstraints(minWidth: context.width),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceAround,
          children: [
            // Navigation Logo
            NavigationHeader.logo(),

            // Menu list
            Padding(
              padding: const EdgeInsets.all(Constants.spacing),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  // Term of Service Button
                  Semantics(
                    label: 'Unidentified Route',
                    link: true,
                    child: Seo.link(
                      anchor: 'Term of Service',
                      href: '/term_of_service.txt',
                      child: DButton.text(
                        onTap: () => context.go('/term_of_service.txt'),
                        text: 'Term of Service',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),

                  // Privacy Pplicy Button
                  Semantics(
                    label: 'Sponsor Us',
                    link: true,
                    child: Seo.link(
                      anchor: 'Privacy Policy',
                      href: 'https://www.buymeacoffee.com/nialixus',
                      child: DButton.text(
                        onTap: () => launchUrl(
                            Uri.parse('https://www.buymeacoffee.com/nialixus')),
                        text: 'Privacy Policy',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),

                  // Contact Us Button
                  Semantics(
                    label: 'Author Email',
                    link: true,
                    child: Seo.link(
                      anchor: 'Contact Us',
                      href: 'mailto://nialixus@gmail.com',
                      child: DButton.text(
                        onTap: () =>
                            launchUrl(Uri.parse('mailto://nialixus@gmail.com')),
                        text: 'Contact Us',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),

                  // Blog Button
                  Semantics(
                    label: 'Github Repository',
                    link: true,
                    child: Seo.link(
                      anchor: 'Blog',
                      href: 'https://github.com/Nialixus/flutter_landing_page',
                      child: DButton.text(
                        onTap: () => launchUrl(
                          Uri.parse('https://github.com/'
                              'Nialixus/flutter_landing_page'),
                        ),
                        text: 'Blog',
                        style: context.text.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.color.primary,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Copyright text
            Semantics(
              label: 'Copyright 2023 Louis Wiwawan',
              child: Seo.link(
                anchor: '© 2023 Louis Wiwawan',
                href: 'https://github.com/Nialixus/'
                    'flutter_landing_page/blob/main/LICENSE',
                child: DButton.text(
                  mainAxisSize: MainAxisSize.min,
                  text: "© 2023 Louis Wiwawan",
                  style: context.text.bodyMedium?.copyWith(
                    color: context.color.background.withOpacity(0.25),
                    fontWeight: FontWeight.w400,
                    fontSize: 11.0,
                  ),
                  textAlign: TextAlign.center,
                  color: Colors.transparent,
                  onTap: () => launchUrl(
                    Uri.parse(
                      'https://github.com/Nialixus/'
                      'flutter_landing_page/blob/main/LICENSE',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
