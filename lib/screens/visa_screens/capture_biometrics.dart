import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';

class ScanBiometrics extends StatefulWidget {
  const ScanBiometrics({super.key});

  @override
  State<ScanBiometrics> createState() => _ScanBiometricsState();
}

class _ScanBiometricsState extends State<ScanBiometrics> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
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
            if (_supportState)
              const Text("This Device is Supported")
            else
              const Text("This Device is Not Supported"),
            const Divider(height: 100),
            CustomButton(
                text: "Authenticate to Proceed",
                styleType: ButtonStyleType.solid,
                onPressed: _authenticate)
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
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print("List of Biometrics : $availableBiometrics");

    if (!mounted) return;
  }
}
