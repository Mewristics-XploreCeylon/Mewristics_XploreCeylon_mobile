import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_checkbutton.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class EmergencyContacts extends StatelessWidget {
  const EmergencyContacts({super.key});

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
                title: "Details of the previous passport",
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                  "For your safety during your travels, please provide two contacts to be notified in case of any emergencies.",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 40),
              Text("Emergency Contact 01 - Own Country",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 20),
              CustomTextField(hint: "Name", label: "Name"),
              CustomTextField(hint: "Address", label: "Address"),
              CustomTextField(hint: "Mobile Number", label: "Mobile Number"),
              CustomTextField(hint: "Relationship", label: "Relationship"),
              CustomCheckButton(
                  label: "Save emergency contact details to profile",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(
                height: 50,
              ),
              Text("Emergency Contact 02 - Sri Lanka",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 20),
              CustomTextField(hint: "Name", label: "Name"),
              CustomTextField(hint: "Address", label: "Address"),
              CustomTextField(hint: "Mobile Number", label: "Mobile Number"),
              CustomTextField(hint: "Relationship", label: "Relationship"),
              CustomCheckButton(
                  label: "Save emergency contact details to profile",
                  style: Theme.of(context).textTheme.headlineSmall),
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
                      onPressed: () {})
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
