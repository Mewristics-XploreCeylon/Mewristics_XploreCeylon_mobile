import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xploreceylon_mobile/config/app_router.dart/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_cubit.dart';
import 'package:xploreceylon_mobile/services/create_visa_info.dart';
import 'package:xploreceylon_mobile/services/create_visa_service/visa_service.dart';

import 'resources/theme.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await initializeDepenedencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

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
    print("pausing....");
    await Future.delayed(const Duration(seconds: 1));
    print("resuming....");
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VisaCubit>(
          create: (_) => VisaCubit(VisaServiceApi(Dio())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'XploreCeylon',
        routerConfig: AppRouter().goRouterConfig,
        theme: getApplicationTheme(),
      ),
    );
  }
}
