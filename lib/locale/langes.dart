import 'dart:ui';

String translateLocaleName(Locale locale) {
  return switch (locale.toLanguageTag()) {
    'ar-SA' => 'عربي',
    'en-US' => 'English',
    _ => 'N/A',
  };
}

String getFlagEmoji(Locale locale) {
  return switch (locale.languageCode) {
    'ar' => '🇸🇦', // Arabic - Saudi Arabia
    'en' => '🇺🇸', // English - United States
    _ => '🏳️', // Default flag
  };
}
