import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_checkbutton.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class EmergencyContacts extends StatefulWidget {
  const EmergencyContacts({super.key});

  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  final _formKey = GlobalKey<FormState>();

  String _contact1Name = '';
  String _contact1Address = '';
  String _contact1Mobile = '';
  String _contact1Relationship = '';

  String _contact2Name = '';
  String _contact2Address = '';
  String _contact2Mobile = '';
  String _contact2Relationship = '';

  RegExp mobileValidation = RegExp(r'^[0-9]{10,12}$');
  RegExp stringValidation = RegExp(r'^[a-zA-Z\s]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Form(
            key: _formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageHeader(
                  title: "Set up Emergency Contacts",
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                    "For your safety during your travels, please provide two contacts to be notified in case of any emergencies.",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 40),

                Text("Emergency Contact 01 - Own Country",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),

                CustomTextField(
                  hint: "Name",
                  label: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact1Name = value!,
                ),

    
                CustomTextField(
                  hint: "Address",
                  label: "Address",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address';
                    } 
                    
                    return null;
                  },
                  onSaved: (value) => _contact1Address = value!,
                ),

      
                CustomTextField(
                  hint: "Mobile Number",
                  label: "Mobile Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!mobileValidation.hasMatch(value)) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact1Mobile = value!,
                ),

          
                CustomTextField(
                  hint: "Relationship",
                  label: "Relationship",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the relationship';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter valid relationship';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact1Relationship = value!,
                ),

                CustomCheckButton(
                    label: "Save emergency contact details to profile",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 50,
                ),

             
                Text("Emergency Contact 02 - Sri Lanka",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),

           
                CustomTextField(
                  hint: "Name",
                  label: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact2Name = value!,
                ),

                CustomTextField(
                  hint: "Address",
                  label: "Address",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact2Address = value!,
                ),

             
                CustomTextField(
                  hint: "Mobile Number",
                  label: "Mobile Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!mobileValidation.hasMatch(value)) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact2Mobile = value!,
                ),

              
                CustomTextField(
                  hint: "Relationship",
                  label: "Relationship",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the relationship';
                    }else if(!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  onSaved: (value) => _contact2Relationship = value!,
                ),

                CustomCheckButton(
                    label: "Save emergency contact details to profile",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
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
                           
                            print('Form Saved for Later');
                          }
                        }),
                    const Spacer(),
                    CustomButton(
                        text: "Next",
                        styleType: ButtonStyleType.solid,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                           
                            GoRouter.of(context).pushNamed(Routes.visitDetails);
                          }
                        })
                  ],
                ),

                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
