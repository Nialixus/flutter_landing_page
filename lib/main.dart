import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:flutter_landing_page/firebase_options.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:seo/seo.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:dart_fusion/dart_fusion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if (kIsWeb) MetaSEO().config();

  // --------- Remove the line below if you're not setting up firebase ------- //
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    Builder(builder: (context) {
      return SeoController(
        enabled: true,
        tree: WidgetTree(context: context),
        child: MaterialApp.router(
          title: 'Flutter Landing Page',
          routerConfig: Env.routes,
          theme: Constants.lightTheme,
          debugShowCheckedModeBanner: false,
          scrollBehavior: const DBehavior(),
        ),
      );
    }),
  );
}
