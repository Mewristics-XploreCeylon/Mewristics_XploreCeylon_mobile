import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:xploreceylon_mobile/screens/onboarding_screens/onboarding_screens.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_onboarding.dart';

import 'resources/theme.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await initializeDepenedencies();

  runApp(MainApp(onboarding: onboarding));
}

class MainApp extends StatefulWidget {
  final bool onboarding;
  const MainApp({super.key, this.onboarding = false});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  // initialize the app with data and everything
  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'XploreCeylon',
      routerConfig: AppRouter().goRouterConfig,
      theme: getApplicationTheme(),
    );
  }
}
