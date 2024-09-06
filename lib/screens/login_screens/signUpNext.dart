import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/models/user_model/user_mode.dart';
import 'package:xploreceylon_mobile/services/auth_service/auth_service.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';

class SignUpNext extends StatelessWidget {
  final String email;
  final String password;
  const SignUpNext({required this.email, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    String _name = '';
    String _newPassword = '';
    String _confirmPassword = '';
    final _formKey = GlobalKey<FormState>();

    // Future<HttpResponse<String>> createUser(UserModel user) async {
    //   final _apiService = AuthServiceApi(Dio());
    //   try {
    //     final createUser = await _apiService.registerUser(user);
    //     if (createUser.response.statusCode == HttpStatus.ok) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           content: Text('registered sucess'),
    //           duration: Duration(seconds: 1),
    //         ),
    //       );

    //     }
    //   } catch (e) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('failed to register'),
    //         duration: Duration(seconds: 1),
    //       ),
    //     );
    //   }

    //   await _apiService.registerUser(user);
    // }

    Future<void> createUser(UserModel user) async {
      final _apiService = AuthServiceApi(Dio());
      try {
        final token = await _apiService.registerUser(user);

        if (token != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registered successfully'),
              duration: Duration(seconds: 1),
            ),
          );
          // Save the token or perform additional actions here
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed, no token received'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to register'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Form(
          key: _formKey,
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
              CustomTextField(
                hint: "Username",
                label: "Choose a unique username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              CustomTextField(
                hint: "Password",
                label: "Create a strong password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password ';
                  }
                  return null;
                },
                onSaved: (value) => _newPassword = value!,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              CustomTextField(
                hint: "Confirm password",
                label: "Confirm your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your confirm your password';
                  }
                  return null;
                },
                onSaved: (value) => _confirmPassword = value!,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value:
                        false, // Add the appropriate state management for this
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // create user fucntion
                      await createUser(UserModel(
                          username: _name,
                          email: email,
                          password: _confirmPassword));
                      GoRouter.of(context).pushNamed(Routes.signIn);
                    }
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
      ),
    );
  }
}
