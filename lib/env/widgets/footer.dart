// part of '../app.dart';

// class AppFooter extends StatelessWidget {
//   const AppFooter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBackground(
//         backgroundColor: context.color.onBackground,
//         imageColor: context.color.background.withOpacity(0.1),
//         child: Theme(
//           data: context.theme.copyWith(
//             textSelectionTheme: TextSelectionThemeData(
//               selectionColor: context.color.background.withOpacity(0.15),
//             ),
//           ),
//           child: Padding(
//               padding: const EdgeInsets.all(Constant.padding),
//               child: Row(children: [
//                 Expanded(
//                     child: Wrap(
//                         crossAxisAlignment: WrapCrossAlignment.center,
//                         alignment: WrapAlignment.spaceAround,
//                         children: [
//                       const AppLogo(),
//                       Padding(
//                           padding: const EdgeInsets.all(Constant.padding),
//                           child:
//                               Wrap(alignment: WrapAlignment.center, children: [
//                             for (int x = 0; x < 5; x++)
//                               DButton.text(
//                                   style: context.text.bodyMedium
//                                       ?.copyWith(color: context.color.primary),
//                                   onTap: () {
//                                     if (x <= 2) {
//                                       App.controller.onTap(context,
//                                           pageID: Routes.home.path,
//                                           sectionID:
//                                               AppPageModel.home.sections[x].id);
//                                     } else if (x == 3) {
//                                       launchUrl(Uri.parse(Environment.baseUrl
//                                           .replaceAll('/api',
//                                               '/public/term_of_use.txt')));
//                                     } else if (x == 4) {
//                                       launchUrl(Uri.parse(
//                                           "mailto://inidia.app@gmail.com"));
//                                     }
//                                   },
//                                   text: App.format(
//                                       name: [
//                                     Label.footer.starter,
//                                     Label.footer.benefit,
//                                     Label.footer.pricing,
//                                     Label.footer.term,
//                                     Label.footer.contact
//                                   ][x]),
//                                   color: Colors.transparent)
//                           ])),
//                       Text(
//                           "© ${DateTime.now().year == 2023 ? "2023" : "2023 - ${DateTime.now().year}"} Inidia.app",
//                           style: context.text.bodyMedium
//                               ?.copyWith(color: context.color.background))
//                     ]))
//               ])),
//         ));
//   }
// }
