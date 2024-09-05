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

class ApplicantsDetails extends StatelessWidget {
  const ApplicantsDetails({super.key});

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
                title: "Applicant Details",
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                  hint: "Height in centimeters", label: "Height in Centimeters"),
              CustomTextField(hint: "Any visible identification marks/ physical peculiarities", label: "Identification Marks/ Peculiarities"),
              CustomCheckButton(
                  label: "Do not Apply",
                  style: Theme.of(context).textTheme.headlineSmall),
              CustomTextField(hint: "Full address where you currently reside", label: "Address in Country of Domicile"),
              CustomTextField(hint: "Address where you will stay in Sri Lanka", label: "Address in Sri Lanka"),
              CustomTextField(hint: "Current Profession/ Occupation", label: "Profession/ Occupation"),
              CustomTextField(hint: "Name of your current Employer", label: "Name of Employer"),
              CustomTextField(hint: "Address of your current Employer", label: "Address of Employer"),
              
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
                            .pushNamed(Routes.presentPassportDetails);
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
