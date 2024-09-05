import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';
import 'package:xploreceylon_mobile/widgets/custom_checkbutton.dart';

class FamilyBackground extends StatelessWidget {
  const FamilyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: "Family Background",
              ),
              SizedBox(
                height: 60,
              ),
              //text
              CustomTextField(
                  hint: "Full Name of your Spouse", label: "Full Name of your Spouse"),
              CustomTextField(hint: "dd/mm/yyyy", label: "Spouse's Date of Birth"),
              CustomTextField(hint: "Nationality", label: "Spouse's Nationality"),
              CustomTextField(hint: "Current Profession/ Occupation", label: "Profession/ Occupation of Spouse"),
              CustomTextField(hint: "Contact Number", label: "Spouse's Contact Number"),
              CustomTextField(hint: "Passport Number", label: "Spouse's Passport Number"),
              CustomTextField(hint: "dd/mm/yyyy", label: "Date of Expiry"),
              CustomTextField(hint: "Postal Address", label: "Spouse's Postal Address"),

              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CustomButton(
                      text: "Save for later",
                      styleType: ButtonStyleType.border,
                      onPressed: () {}),
                  Spacer(),
                  CustomButton(
                      text: "Next",
                      styleType: ButtonStyleType.solid,
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(Routes.emergencyContacts);
                      })
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
