import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_checkbutton.dart';
import 'package:xploreceylon_mobile/widgets/custom_radiobutton.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class Declaration extends StatelessWidget {
  const Declaration({super.key});

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
                title: "Declaration",
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                  "Read the declaration and, if accepted, press your finger against the scanner to capture a clear imprint.",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image(
                      image: AssetImage("assets/images/fingerprint.png"))),
              SizedBox(
                height: 50,
              ),
              Text(
                  "I hereby declare that to the best of my knowledge and belief the foregoing statements are true, that I shall not engage in any employment, paid or unpaid, or in any business or trade other than the purpose for which the visa is granted.\n\nI shall leave Sri Lanka before the expiry of my authorized stay and will notify the Controller of Immigration \& Emigration, Colombo, immediately of any change in my address while in Sri Lanka.",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 10),
              CustomCheckButton(
                  label: "Read and understood ",
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CustomButton(
                    text: "Next",
                    styleType: ButtonStyleType.solid,
                    onPressed: () {
                      GoRouter.of(context).pushNamed(Routes.visaApplicationFee);
                    }),
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
