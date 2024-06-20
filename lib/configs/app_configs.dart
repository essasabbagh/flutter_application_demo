import 'dart:ui';

class AppConfigs {
  static String baseUrl = 'https://dummyjson.com';
  static Map<String, String> appLocales = {
    'en': 'English',
    'ar': 'Arabic',
  };

  /// Fallback locale :
  /// Locale('en', 'US')
  static const Locale fallbackLocale = Locale('en', 'US');
}
