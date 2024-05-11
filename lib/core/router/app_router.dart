import 'package:flutter/foundation.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/core/keys/keys.dart';
import 'package:flutter_application_demo/home_screen.dart';
import 'package:flutter_application_demo/providers/auth/auth_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // final authNotifier = ref.read(authNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    // initialLocation: HomePage.routeName,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/', //  HomePage.routeName,
        builder: (context, state) => const MyHomePage(),
      ),
      // GoRoute(
      //   path: LoginPage.routeName,
      //   builder: (context, state) => const LoginPage(),
      // ),
    ],
    // refreshListenable: authNotifier,
    // redirect: (context, state) => authNotifier.redirect(
    //   goRouterState: state,
    //   showErrorIfNonExistentRoute: true,
    // ),
  );
});
