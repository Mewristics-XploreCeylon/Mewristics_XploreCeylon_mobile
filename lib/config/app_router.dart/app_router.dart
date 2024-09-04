import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/routes.dart';
import 'package:xploreceylon_mobile/screens/onboarding_screens/onboarding_screens.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_onboarding.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_personal_information.dart';
import '../../screens/visa_screens/capture_biometrics.dart';

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
            return const MaterialPage(child: Onboarding());
          }),
      GoRoute(
          name: Routes.visaOnboarding,
          path: "/visaOnboarding",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaOnboarding());
          }),
      GoRoute(
          name: Routes.visaPersonalInformation,
          path: "/visaPersonalInformation",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaPersonalInformation());
          }),
      GoRoute(
          name: Routes.biometricAuthentication,
          path: "/biometricAuthentication",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: ScanBiometrics());
          }),
      GoRoute(
          name: Routes.onboarding,
          path: '/onboarding',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: Onboarding());
          })
    ],
  );
}
