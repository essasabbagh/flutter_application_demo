import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/core/keys/keys.dart';
import 'package:flutter_application_demo/core/router/app_router.dart';
import 'package:flutter_application_demo/core/themes/app_theme.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeAnimationCurve: Curves.bounceInOut,
      themeAnimationDuration: kThemeAnimationDuration,
      // themeAnimationStyle: AnimationStyle(),
    );
  }
}
