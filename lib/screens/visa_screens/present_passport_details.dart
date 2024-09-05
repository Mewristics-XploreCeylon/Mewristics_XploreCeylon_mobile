import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class PresentPassportDetails extends StatefulWidget {
  const PresentPassportDetails({super.key});

  @override
  _PresentPassportDetailsState createState() => _PresentPassportDetailsState();
}

class _PresentPassportDetailsState extends State<PresentPassportDetails> {
  final _formKey = GlobalKey<FormState>();


  String _passportNumber = '';
  String _placeOfIssue = '';
  String _dateOfIssue = '';
  String _dateOfExpiry = '';


  RegExp dateValidation = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  RegExp passportNumberValidation = RegExp(r'^[a-zA-Z0-9]+$');
    RegExp stringValidation = RegExp(r'^[a-zA-Z\s]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: "Details of the present passport",
                ),
                SizedBox(
                  height: 60,
                ),
                
                
                CustomTextField(
                  hint: "Passport Number",
                  label: "Passport Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your passport number';
                    } else if (!passportNumberValidation.hasMatch(value)) {
                      return 'Please enter a valid passport number';
                    }
                    return null;
                  },
                  onSaved: (value) => _passportNumber = value!,
                ),
                
          
                CustomTextField(
                  hint: "Place of issue",
                  label: "Place of issue",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the place of issue';
                    }else if(!stringValidation.hasMatch(value)){
                      'Please enter the place of issue';
                    }
                    return null;
                  },
                  onSaved: (value) => _placeOfIssue = value!,
                ),
                
            
                CustomTextField(
                  hint: "dd/mm/yyyy",
                  label: "Date of Issue",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of issue';
                    } else if (!dateValidation.hasMatch(value)) {
                      return 'Please enter a valid date in dd/mm/yyyy format';
                    }
                    return null;
                  },
                  onSaved: (value) => _dateOfIssue = value!,
                ),
                
              
                CustomTextField(
                  hint: "dd/mm/yyyy",
                  label: "Date of Expiry",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of expiry';
                    } else if (!dateValidation.hasMatch(value)) {
                      return 'Please enter a valid date in dd/mm/yyyy format';
                    }
                    return null;
                  },
                  onSaved: (value) => _dateOfExpiry = value!,
                ),
                
                SizedBox(
                  height: 50,
                ),
                
                Row(
                  children: [
                  
                    CustomButton(
                      text: "Save for later",
                      styleType: ButtonStyleType.border,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                      
                          print('Form Saved');
                        }
                      },
                    ),
                    
                    Spacer(),
                    
                  
                    CustomButton(
                      text: "Next",
                      styleType: ButtonStyleType.solid,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          GoRouter.of(context).pushNamed(Routes.previousPassportDetails);
                        }
                      },
                    ),
                  ],
                ),
                
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
