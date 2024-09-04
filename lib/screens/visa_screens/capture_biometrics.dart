import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../widgets/page_header.dart';

class ScanBiometrics extends StatefulWidget {
  const ScanBiometrics({super.key});

  @override
  State<ScanBiometrics> createState() => _ScanBiometricsState();
}

class _ScanBiometricsState extends State<ScanBiometrics> {
  late final LocalAuthentication auth;
  // bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            // _supportState = isSupported;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(),
      body:
          // if (_supportState)
          //   const Text("This Device is Supported")
          // else
          //   const Text("This Device is Not Supported"),
          // const Divider(height: 100),
          Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          children: [
            PageHeader(
              title: "Capture Your Biometrics",
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "To ensure the security of your application, we'll need to capture a facial scan. This process is quick and secure.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child:
                    Image(image: AssetImage("assets/images/biometrics.png"))),
            SizedBox(
              height: 60,
            ),
            Text(
              "Please Authenticate in order to Proceed with the Visa Application Process.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 60,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: CustomButton(
                text: "Authenticate to Proceed",
                styleType: ButtonStyleType.solid,
                onPressed: () async {
                  await _authenticate();
                  GoRouter.of(context)
                      .pushNamed(Routes.visaPersonalInformation);
                },
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason:
            "This is a verification of your identity in order to proceed with the visa application process.",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      print("Authenticated : $authenticated");

      if (authenticated)
        GoRouter.of(context).pushNamed(Routes.visaPersonalInformation);
      ;
    } on PlatformException catch (e) {
      print(e);
    }
  }
  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics =
  //       await auth.getAvailableBiometrics();
  //   print("List of Biometrics : $availableBiometrics");

  //   if (!mounted) return;
  // }
}
