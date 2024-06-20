import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_application_demo/configs/app_configs.dart';
import 'package:flutter_application_demo/core/data/local/get_storage_service.dart';
import 'package:flutter_application_demo/core/data/local/json_local_storage.dart';

part 'locale_provider.g.dart';

/// Supported Locales Provider
/// Update this list to expand the number of supported locales in the app
final supportedLocalesProvider = Provider<List<Locale>>((_) {
  return const [
    Locale('ar', 'SA'),
    Locale('en', 'US'),
  ];
});
const String languageCodeKey = 'languageCode';

@riverpod
class LocaleController extends _$LocaleController {
  static final storageService = GetStorageService();
  static final jsonStorage = JsonStorage(storageService);
  @override
  Locale build() {
    try {
      // Check local storage availability
      final localStorage = storageService.read(languageCodeKey);

      if (localStorage.isEmpty) {
        // Return device default language
        final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
        return deviceLocale;
      } else {
        // return local Storage
        final locale = const LocaleJsonConverter().fromJson(localStorage);
        return locale;
      }
    } catch (_) {
      return AppConfigs.fallbackLocale;
    }
  }

  void changeLocale(Locale locale) {
    state = locale;

    storageService.save(
      languageCodeKey,
      const LocaleJsonConverter().toJson(locale),
    );
  }
}

/// Locale Json Converter
/// Locale does not come with toJson / fromJson functions, so we
/// use these overrides to work with freezed / json_serializable
class LocaleJsonConverter {
  const LocaleJsonConverter();

  Locale fromJson(String json) {
    Map<String, dynamic> jsonLocale = jsonDecode(json);
    return Locale.fromSubtags(
        languageCode: jsonLocale['languageCode']!,
        countryCode: jsonLocale['countryCode']);
  }

  String toJson(Locale locale) {
    return jsonEncode({
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode
    });
  }
}
