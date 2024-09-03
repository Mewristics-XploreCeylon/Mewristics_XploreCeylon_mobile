import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/routes.dart';
import 'package:xploreceylon_mobile/main.dart';
import 'package:xploreceylon_mobile/screens/login_screens/sign_in.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/emergency_contacts.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/past_passport_details.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/present_passport_details.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_application_fee.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_details.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_onboarding.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_personal_information.dart';
import '../../screens/visa_screens/capture_biometrics.dart';
import '../../screens/visa_screens/declaration.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter goRouterConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Initial route
      GoRoute(
          name: Routes.splash,
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: Declaration());
          }),

      // Routes for screens
      GoRoute(
          name: Routes.visaOnboarding,
          path: "/visaOnboarding",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaOnboarding());
          }),
      GoRoute(
          name: Routes.biometricAuthentication,
          path: "/biometricAuthentication",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: ScanBiometrics());
          }),
      GoRoute(
          name: Routes.visaPersonalInformation,
          path: "/visaPersonalInformation",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaPersonalInformation());
          }),
      GoRoute(
          name: Routes.presentPassportDetails,
          path: "/presentPassportDetails",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: PresentPassportDetails());
          }),
      GoRoute(
          name: Routes.previousPassportDetails,
          path: "/previousPassportDetails",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: PreviousPassportDetails());
          }),
      GoRoute(
          name: Routes.emergencyContacts,
          path: "/emergencyContacts",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: EmergencyContacts());
          }),
      GoRoute(
          name: Routes.visaDetails,
          path: "/visaDetails",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaDetails());
          }),
      GoRoute(
          name: Routes.visaApplicationFee,
          path: "/visaApplicationFee",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: VisaApplicationFee());
          }),
             GoRoute(
          name: Routes.declaration,
          path: "/declaration",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: Declaration());
          }),   
      GoRoute(
          name: Routes.signIn,
          path: "/signIn",
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: SignIn());
          }),
    ],
  );
}
