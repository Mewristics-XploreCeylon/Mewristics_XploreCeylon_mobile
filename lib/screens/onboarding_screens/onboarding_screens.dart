import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/screens/onboarding_screens/onboarding_items.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_onboarding.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';

import '../../config/app_router.dart/routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) => setState(
              () {
                isLastPage = controller.items.length - 1 == index;
              },
            ),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(controller.items[index].image),
                    fit: BoxFit.cover, // Cover the entire screen
                  ),
                ),
                child: Container(
                  color: Colors.black
                      .withOpacity(0.6), // Add a semi-transparent overlay
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 200),
                        Text(
                          controller.items[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.items[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: controller.items.length,
                  onDotClicked: (index) => pageController.animateToPage(
                    index,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                  ),
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2.5,
                    dotHeight: 12,
                    dotWidth: 12,
                    dotColor: Colors.white,
                    activeDotColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                isLastPage
                    ? CustomButton(
                        text: "Start Your Journey",
                        styleType: ButtonStyleType.solid,
                        onPressed: () {
                          context.go(Routes.visaOnboarding);
                        },
                        useSizedBox: true,
                      )
                    : CustomButton(
                        text: "Next",
                        styleType: ButtonStyleType.solid,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        ),
                        useSizedBox: true,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
