import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
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
            SizedBox(height: 100),
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
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value:
                          false, 
                      onChanged: (value) {
                      
                      },
                    ),
                    Text("Remember Me",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: CustomButton(
                text: "Sign In",
                styleType: ButtonStyleType.solid,
                onPressed: () {
                
                  GoRouter.of(context).pushNamed(Routes.visaOnboarding);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "or sign in with",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/fb.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/google.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/apple.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet? ",
                          style: Theme.of(context).textTheme.headlineMedium),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(Routes.signUp);
                        
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
