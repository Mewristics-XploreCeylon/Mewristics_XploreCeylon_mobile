import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/sizes.dart';

import '../../config/app_router.dart/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/page_header.dart';

class VisaOnboarding extends StatelessWidget {
  const VisaOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          children: [
            const PageHeader(
              title: "Let's Get Started with Your Visa Application",
            ),
            const SizedBox(
              height: 20,
            ),
            const Image(image: AssetImage("assets/images/passports.png")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "We'll guide you through a simple process to get your visa approved.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 50,
            ),
            const Spacer(), // Pushes the content up
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: CustomButton(
                  text: 'Start Application',
                  styleType: ButtonStyleType.solid,
                  onPressed: () {
                    context.go(Routes.visaPersonalInformation);
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
