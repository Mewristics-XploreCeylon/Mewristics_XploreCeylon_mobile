import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
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
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              "Secure your account",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Let’s personalize and secure your account.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                hint: "Username", label: "Choose a unique username"),
            CustomTextField(
              hint: "Password",
              label: "Create a strong password",
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
              ),
            ),
            CustomTextField(
              hint: "Confirm password",
              label: "Confirm your password",
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
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
            SizedBox(
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
            SizedBox(
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
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 15,
                    ),
                    SizedBox(
                        width: 5), // Optional spacing between icon and text
                    Text("Back",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
