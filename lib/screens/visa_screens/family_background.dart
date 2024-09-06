import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class FamilyBackground extends StatelessWidget {
  const FamilyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: "Family Background",
              ),
              const SizedBox(
                height: 60,
              ),
              //text
              const CustomTextField(
                  hint: "Full Name of your Spouse", label: "Full Name of your Spouse"),
              const CustomTextField(hint: "dd/mm/yyyy", label: "Spouse's Date of Birth"),
              const CustomTextField(hint: "Nationality", label: "Spouse's Nationality"),
              const CustomTextField(hint: "Current Profession/ Occupation", label: "Profession/ Occupation of Spouse"),
              const CustomTextField(hint: "Contact Number", label: "Spouse's Contact Number"),
              const CustomTextField(hint: "Passport Number", label: "Spouse's Passport Number"),
              const CustomTextField(hint: "dd/mm/yyyy", label: "Date of Expiry"),
              const CustomTextField(hint: "Postal Address", label: "Spouse's Postal Address"),

              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CustomButton(
                      text: "Save for later",
                      styleType: ButtonStyleType.border,
                      onPressed: () {}),
                  const Spacer(),
                  CustomButton(
                      text: "Next",
                      styleType: ButtonStyleType.solid,
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.emergencyContacts);
                      })
                ],
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
