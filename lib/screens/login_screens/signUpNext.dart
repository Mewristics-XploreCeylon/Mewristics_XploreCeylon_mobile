import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';

class SignUpNext extends StatelessWidget {
  const SignUpNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              "Secure your account",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Let’s personalize and secure your account.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
                hint: "Username", label: "Choose a unique username"),
            CustomTextField(
              hint: "Password",
              label: "Create a strong password",
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
              ),
            ),
            CustomTextField(
              hint: "Confirm password",
              label: "Confirm your password",
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: false, // Add the appropriate state management for this
                  onChanged: (value) {
                    // Handle remember me logic
                  },
                ),
                Text("I agree to the terms and conditions",
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: CustomButton(
                text: "Sign Up",
                styleType: ButtonStyleType.solid,
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routes.signIn);
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Center the "Back" button with the icon
            Center(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(Routes.signUp);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Shrink to fit the content
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 15,
                    ),
                    const SizedBox(
                        width: 5), // Optional spacing between icon and text
                    Text("Back",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
