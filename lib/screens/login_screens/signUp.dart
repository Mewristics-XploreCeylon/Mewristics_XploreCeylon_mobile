import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String _password = '';
    String _email = '';
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Text(
                "Join the Adventure!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Create your account to start exploring Sri Lanka your way.",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Email Address",
                label: "Email Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password number';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              CustomTextField(
                hint: "Password",
                label: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password number';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CustomButton(
                  text: "Continue",
                  styleType: ButtonStyleType.solid,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      GoRouter.of(context).pushNamed(
                        Routes.signUpNext,
                        extra: {
                          'email': _email,
                          'password': _password,
                        },
                      );
                    }
                    // Handle sign in
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "or sign in with",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: Theme.of(context).textTheme.headlineMedium),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(Routes.signIn);
                          },
                          child: const Text(
                            "Sign In",
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
      ),
    );
  }
}
