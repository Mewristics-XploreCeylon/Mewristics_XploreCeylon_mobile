import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/app_router.dart';

import 'resources/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await initializeDepenedencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
