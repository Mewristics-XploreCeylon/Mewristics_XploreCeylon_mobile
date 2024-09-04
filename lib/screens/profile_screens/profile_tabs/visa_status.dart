import 'package:flutter/cupertino.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

import '../../../constants/sizes.dart';

class VisaStatusTab extends StatelessWidget {
  const VisaStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m24),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryFeildColor,
            ),
          ),
          Text(
            "About visa in Sri Lanka",
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m24),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryFeildColor,
            ),
          ),
        ],
      ),
    );
  }
}
