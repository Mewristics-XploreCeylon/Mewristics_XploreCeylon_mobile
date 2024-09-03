// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';
import '../../widgets/payment_type_card.dart';

class VisaApplicationFee extends StatefulWidget {
  const VisaApplicationFee({super.key});

  @override
  _VisaApplicationFeeState createState() => _VisaApplicationFeeState();
}

class _VisaApplicationFeeState extends State<VisaApplicationFee> {
  // Variable to keep track of the selected payment method
  String _selectedPaymentMethod = "";

  // Method to handle the change in selected payment method
  void _onPaymentMethodChanged(String value) {
    setState(() {
      _selectedPaymentMethod = value;
    });
  }

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
                title: "Visa Application Fee",
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "To complete your application, please pay the visa processing fee",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              PaymentTypeCard(
                payment: "Debit Card",
                image: "assets/images/visa.png",
                isSelected: _selectedPaymentMethod == "Debit Card",
                onSelected: () => _onPaymentMethodChanged("Debit Card"),
              ),
              PaymentTypeCard(
                payment: "Credit Card",
                image: "assets/images/creditCard.png",
                isSelected: _selectedPaymentMethod == "Credit Card",
                onSelected: () => _onPaymentMethodChanged("Credit Card"),
              ),
              PaymentTypeCard(
                payment: "Apple Pay",
                image: "assets/images/applePay.png",
                isSelected: _selectedPaymentMethod == "Apple Pay",
                onSelected: () => _onPaymentMethodChanged("Apple Pay"),
              ),
              PaymentTypeCard(
                payment: "PayPal",
                image: "assets/images/payPal.png",
                isSelected: _selectedPaymentMethod == "PayPal",
                onSelected: () => _onPaymentMethodChanged("PayPal"),
              ),
              PaymentTypeCard(
                payment: "Google Pay",
                image: "assets/images/googlePay.png",
                isSelected: _selectedPaymentMethod == "Google Pay",
                onSelected: () => _onPaymentMethodChanged("Google Pay"),
              ),
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
                            .pushNamed(Routes.biometricAuthentication);
                        // if (_selectedPaymentMethod.isNotEmpty) {
                        //   // Proceed with the selected payment method
                        // } else {
                        //   // Handle case where no payment method is selected
                        // }
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
