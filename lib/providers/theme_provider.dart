import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/core/data/local/get_storage_service.dart';
import 'package:flutter_application_demo/globals.dart';

import '../core/data/local/storage_service.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(storageServiceProvider);
    return AppThemeModeNotifier(storage);
  },
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageService.save(themeKey, state.name);
  }

  void getCurrentTheme() async {
    final theme = storageService.read(themeKey);
    if (theme.isEmpty) {
      state = ThemeMode.system;
    } else {
      final value = ThemeMode.values.byName(theme);
      state = value;
    }
  }
}
