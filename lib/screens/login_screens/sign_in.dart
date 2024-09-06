import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/auth_singleton.dart';
import '../../constants/sizes.dart';
import '../../models/user_model/user_mode.dart';
import '../../services/auth_service/auth_service.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';
    final _formKey = GlobalKey<FormState>();

    Future<void> loginUser(UserModel user) async {
      final _apiService = AuthServiceApi(Dio());
      try {
        final token = await _apiService.loginUser(user);

        if (token != null) {
          AuthTokenSingleton().authToken = token.data;
          // use this to reteivew the token from singleton
          print(AuthTokenSingleton().authToken);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successfully'),
              duration: Duration(seconds: 1),
            ),
          );
          // Save the token or perform additional actions here
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed, no token received'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to Login'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

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
                "Welcome back!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Email Address",
                label: "Email Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
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
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value:
                            false, // Add the appropriate state management for this
                        onChanged: (value) {
                          // Handle remember me logic
                        },
                      ),
                      Text("Remember Me",
                          style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password Screen
                    },
                    child: const Text(
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
              const SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CustomButton(
                  text: "Sign In",
                  styleType: ButtonStyleType.solid,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // create user fucntion
                      await loginUser(
                          UserModel(email: _email, password: _password));
                      GoRouter.of(context).pushNamed(Routes.visaOnboarding);
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
                        Text("Don't have an account yet? ",
                            style: Theme.of(context).textTheme.headlineMedium),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(Routes.signUp);
                            // Navigate to the signup screen
                          },
                          child: const Text(
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
      ),
    );
  }
}
