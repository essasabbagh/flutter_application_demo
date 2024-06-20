import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/core/extensions/context_ext.dart';
import 'package:flutter_application_demo/core/keys/keys.dart';
import 'package:flutter_application_demo/core/router/app_router.dart';
import 'package:flutter_application_demo/core/themes/app_theme.dart';
import 'package:flutter_application_demo/locale/generated/l10n.dart';
import 'package:flutter_application_demo/locale/provider/locale_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('----------------------------------------------------------------');
    print(View.of(context).platformDispatcher.locales);
    final goRouter = ref.watch(goRouterProvider);
    // Get supported locales
    List<Locale> supportedLocales = ref.read(supportedLocalesProvider);

    // Watch the current locale and rebuild on change
    Locale locale = ref.watch(localeControllerProvider);

    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeAnimationCurve: Curves.bounceInOut,
      themeAnimationDuration: kThemeAnimationDuration,
      // themeAnimationStyle: AnimationStyle(),
      locale: locale,
      supportedLocales: supportedLocales,
      onGenerateTitle: (context) => S.of(context).appName,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          // Replace the textScaler with the calculated scale.
          data: context.mediaQuery.copyWith(
            textScaler: context.clampTextScaler,
          ),
          child: child!,
        );
      },
    );
  }
}
