import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/providers/prefs_provider.dart';
import 'app_colors.dart';

final appThemeProvider = StateNotifierProvider<AppThemes,ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferenceProvider);
  return AppThemes(prefs);
});

class AppThemes extends StateNotifier<ThemeMode> {
  final SharedPreferences _sharedPreferences;
  String themeMode = "dark";

  AppThemes(this._sharedPreferences) : super(ThemeMode.system) {
    themeMode = _sharedPreferences.getString('theme') ?? 'light';
    setTheme(themeMode);
  }

  void toggleTheme() {
    final newTheme = themeMode == 'dark' ? 'light' : 'dark';
    setTheme(newTheme);
  }

  void setTheme(String theme) {
    themeMode = theme;
    _sharedPreferences.setString('theme', theme);
    switch (theme) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;

    }
  }

  bool get isDark => themeMode == "dark";

  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      hintColor: Colors.grey,
      dialogBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Lexend'),
        bodyMedium: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'Lexend'),
        displayLarge: TextStyle(
            color: textColor,
            fontSize: 96,
            fontWeight: FontWeight.w300,
            fontFamily: 'Lexend'),
        displayMedium: TextStyle(
            color: textColor,
            fontSize: 60,
            fontWeight: FontWeight.w300,
            fontFamily: 'Lexend'),
        displaySmall: TextStyle(
            color: textColor,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
        headlineMedium: TextStyle(
            color: textColor,
            fontSize: 34,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
        headlineSmall: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
        titleLarge: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lexend'),
        titleMedium: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
        titleSmall: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lexend'),
        labelLarge: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lexend'),
        bodySmall: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
        labelSmall: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lexend'),
      ),



      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              primaryColor,
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            textStyle: WidgetStatePropertyAll(
                GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500)),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          )),
      scaffoldBackgroundColor: bgColor,
      listTileTheme: ListTileThemeData(
        iconColor: Colors.black,
        textColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          sizeConstraints: BoxConstraints(maxHeight: 40),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        indicatorColor: primaryColor,
      ),
      appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: bgColor,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bgColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: bgColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: GoogleFonts.lexend(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black)),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ));

}
