import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../constants/sizes.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150),
            Text(
              "Welcome back!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(hint: "Email Address", label: "Email Address"),
            CustomTextField(
                hint: "Password",
                label: "Password",
                iconButton:
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))),
          ],
        ),
      ),
    );
  }
}
