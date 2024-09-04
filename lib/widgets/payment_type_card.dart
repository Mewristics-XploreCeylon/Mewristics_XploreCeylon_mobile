import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PaymentTypeCard extends StatelessWidget {
  final String payment;
  final String image;
  final bool isSelected;
  final VoidCallback onSelected;

  const PaymentTypeCard({
    Key? key,
    required this.payment,
    required this.image,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onSelected,
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryFeildColor,
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  payment,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Spacer(),
                if (isSelected)
                  Icon(
                    Icons.radio_button_checked,
                    color: AppColors.primaryColor,
                  )
                else
                  Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
