import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonStyleType styleType;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.styleType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          styleType == ButtonStyleType.solid
              ? AppColors().primaryColor
              : Colors.white,
        ),
        side: WidgetStateProperty.all(
          styleType == ButtonStyleType.border
              ? BorderSide(color: AppColors().primaryColor, width: 2)
              : BorderSide.none,
        ),
        foregroundColor: WidgetStateProperty.all(
          styleType == ButtonStyleType.border
              ? AppColors().primaryColor
              : Colors.white,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        minimumSize: WidgetStateProperty.all(const Size(150, 50)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

enum ButtonStyleType { solid, border }
