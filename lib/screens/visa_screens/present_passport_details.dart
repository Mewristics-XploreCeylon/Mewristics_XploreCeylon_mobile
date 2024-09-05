import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class PresentPassportDetails extends StatelessWidget {
  const PresentPassportDetails({super.key});

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
                title: "Details of the present passport",
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Upload an image of the last page of your passport",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppMargin.m12),
                child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryFeildColor,
                      ),
                      height: 150,
                      child: Center(
                          child: Icon(
                        Icons.cloud_upload_outlined,
                        color: AppColors.fieldTextColor,
                      ))),
                ),
              ),
              CustomTextField(
                  hint: "Passport Number", label: "Passport Number"),
              CustomTextField(hint: "Place of issue", label: "Place of issue"),
              CustomTextField(hint: "dd/mm/yy", label: "Date of Issue"),
              CustomTextField(hint: "dd/mm/yy", label: "Date of Expiry"),
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
                        GoRouter.of(context).pushNamed(Routes.previousPassportDetails);
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
