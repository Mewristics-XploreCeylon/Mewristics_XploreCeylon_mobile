import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_cubit.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_state.dart';
import 'package:xploreceylon_mobile/services/create_visa_info.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/page_header.dart';

class PreviousPassportDetails extends StatefulWidget {
  const PreviousPassportDetails({super.key});

  @override
  _PreviousPassportDetailsState createState() =>
      _PreviousPassportDetailsState();
}

class _PreviousPassportDetailsState extends State<PreviousPassportDetails> {
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
                  title: "Details of the previous passport",
                ),
                const SizedBox(
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
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter the place of issue';
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
                          print('Form Saved');
                          final stateRead = context.read<VisaCubit>().state;
                        }
                      },
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "Next",
                      styleType: ButtonStyleType.solid,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final visaInfo = context.read<VisaCubit>().state;

                          if (visaInfo is GetVisaInfoState) {
                            context.read<VisaCubit>().updatePastPassportInfo(
                                _passportNumber,
                                _placeOfIssue,
                                _dateOfIssue,
                                _dateOfExpiry);
                            // print(
                            //     "email ${visaInfo.populatedVisaInfo.emailAddress}");
                            // print(
                            //     "pre passport ${visaInfo.populatedVisaInfo.prevPassportNumber}");
                            // print(
                            //     "passport ${visaInfo.populatedVisaInfo.passportNumber}");
                          }

                          GoRouter.of(context)
                              .pushNamed(Routes.emergencyContacts);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
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
