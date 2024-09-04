import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/sizes.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/page_header.dart';

class VisaOnboarding extends StatelessWidget {
  const VisaOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
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
              height: 60,
            ),
            const Spacer(), // Pushes the content up
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: CustomButton(
                  text: 'Start Application',
                  styleType: ButtonStyleType.solid,

                  // have to change to home page
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
