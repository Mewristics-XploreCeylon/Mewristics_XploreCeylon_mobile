import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonStyleType styleType;
  final VoidCallback onPressed;
  final bool useSizedBox;
  final bool isPrimaryColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.styleType,
    required this.onPressed,
    this.useSizedBox = false,
    this.isPrimaryColor = true,
  });

  @override
  Widget build(BuildContext context) {
    final buttonChild = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          styleType == ButtonStyleType.solid
              ? isPrimaryColor
                  ? AppColors.primaryColor
                  : Colors.white
              : Colors.white,
        ),
        side: WidgetStatePropertyAll(
          styleType == ButtonStyleType.border
              ? BorderSide(color: AppColors.primaryColor, width: 2)
              : BorderSide.none,
        ),
        foregroundColor: WidgetStateProperty.all(
          styleType == ButtonStyleType.border || !isPrimaryColor
              ? AppColors.primaryColor 
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
          fontSize: 16,
        ),
      ),
    );

    if (useSizedBox) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: buttonChild,
      );
    } else {
      return FractionallySizedBox(
        widthFactor: 0.8,
        child: buttonChild,
      );
    }
  }
}

enum ButtonStyleType { solid, border }
