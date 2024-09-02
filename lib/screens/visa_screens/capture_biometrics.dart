import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
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
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // if (_supportState)
            //   const Text("This Device is Supported")
            // else
            //   const Text("This Device is Not Supported"),
            // const Divider(height: 100),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m24, vertical: AppMargin.m24),
              child: const Column(
                children: [
                  PageHeader(
                    title: "Capture Your Biometrics",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "To ensure the security of your application, we'll need to capture a facial scan. This process is quick and secure.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage("assets/images/passports.png")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please Authenticate in order to Proceed with the Visa Application Process.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "Authenticate to Proceed",
              styleType: ButtonStyleType.solid,
              onPressed: _authenticate,
            ),
            const SizedBox(height: 70),
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
          biometricOnly: false,
        ),
      );

      print("Authenticated : $authenticated");

      if (authenticated) context.go(Routes.visaPersonalInformation);
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
