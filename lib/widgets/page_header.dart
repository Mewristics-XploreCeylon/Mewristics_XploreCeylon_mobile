import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

class PageHeader extends StatelessWidget {
  final String title;

  const PageHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.contentColor,
                ),
          ),
        ),
      ],
    );
  }
}
