import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_radiobutton.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class VisaDetails extends StatelessWidget {
  const VisaDetails({super.key});

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
                title: "Visa Details",
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                  hint: "Objective", label: "Object of Present Visit:"),
              CustomTextField(
                  hint: "Route and Mode",
                  label: "Route and Mode of Travel to Sri Lanka"),
              CustomTextField(hint: "Address", label: "Address During Stay"),
              CustomTextField(
                  hint: "", label: "Period for Which Visit Visa is Required"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Whether Permission to Visit Sri Lanka or Extend Stay has been Refused Previously",
                  style: Theme.of(context).textTheme.headlineMedium),
              CustomRadioButton(
                options: ["Yes", "No"],
                labelBuilder: (option) => option,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hint: "",
                  label: "Amount of Money in US\$ Available on Arrival"),
              CustomTextField(
                  hint: "Card details",
                  label: "If Credit Card Available, Name of Cards"),
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
                            .pushNamed(Routes.visaApplicationFee);
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
