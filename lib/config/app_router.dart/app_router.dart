import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/routes.dart';
import 'package:xploreceylon_mobile/main.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_onboarding.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter goRouterConfig = GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
            name: Routes.splash,
            path: '/',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const MaterialPage(child: VisaOnboarding());
            }),

            GoRoute(
              name: Routes.visaOnboarding,
              path: "/visaOnboarding",
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const MaterialPage(child: VisaOnboarding());
              }
            )
      ]);
}
