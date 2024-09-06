import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_radiobutton.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class VisitDetails extends StatelessWidget {
  const VisitDetails({super.key});

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
                title: "Visa Details",
              ),
              const SizedBox(
                height: 60,
              ),
              const CustomTextField(
                  hint: "Objective", label: "Object of Present Visit:"),
              const CustomTextField(
                  hint: "Route and Mode",
                  label: "Route and Mode of Travel to Sri Lanka"),
              const CustomTextField(hint: "Address", label: "Address During Stay"),
              const CustomTextField(
                  hint: "", label: "Period for Which Visit Visa is Required"),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "Whether Permission to Visit Sri Lanka or Extend Stay has been Refused Previously",
                  style: Theme.of(context).textTheme.headlineMedium),
              CustomRadioButton(
                options: const ["Yes", "No"],
                labelBuilder: (option) => option,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                  hint: "",
                  label: "Amount of Money in US\$ Available on Arrival"),
              const CustomTextField(
                  hint: "Card details",
                  label: "If Credit Card Available, Name of Cards"),
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
                            .pushNamed(Routes.visaApplicationFee);
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
