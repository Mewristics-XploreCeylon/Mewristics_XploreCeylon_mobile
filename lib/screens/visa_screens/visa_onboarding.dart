import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/sizes.dart';

class VisaOnboarding extends StatelessWidget {
  const VisaOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          children: [
            Text("Let's Get Started with Your Visa Application",
            style: Theme.of(context).textTheme.headlineLarge,
             ),
             SizedBox(height: 20,),
             Image(image: AssetImage("assets/images/passports.png")),
             SizedBox(height: 20,),
             Text("We'll guide you through a simple process to get your visa approved.",
             style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
    );
  }
}
