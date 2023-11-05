part of '../env.dart';

class Constants {
  static const Curve curve = Curves.easeInOut;
  static const Duration duration = Duration(milliseconds: 300);
  static const double padding = 20.0;
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      dividerColor: Colors.transparent,
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.black.withOpacity(0.15)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black),
          selectedLabelStyle:
              TextStyle(fontSize: 10.0, color: Color((0xff28213d)))),
      textTheme: TextTheme(
          titleLarge: const TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 46.0,
              color: Colors.white),
          titleMedium: const TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 18.0,
              color: Colors.white),
          bodyMedium: TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 12.0,
              color: Colors.white.withOpacity(0.5)),
          bodySmall: TextStyle(
            fontSize: 11.0,
            color: Colors.white.withOpacity(0.5),
          )),
      colorScheme: const ColorScheme.light(
          error: Color(0xFFBF215A),
          primary: Color(0xff0D47A1),
          background: Colors.white,
          onPrimary: Colors.white,
          onBackground: Colors.black,
          outline: Colors.grey,
          surface: Color(0xffF5F9FF)));
}
