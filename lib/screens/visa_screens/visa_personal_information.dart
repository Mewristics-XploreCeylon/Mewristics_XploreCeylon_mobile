import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/constants/sizes.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_cubit.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_state.dart';
import 'package:xploreceylon_mobile/services/create_visa_info.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_button.dart';
import 'package:xploreceylon_mobile/widgets/custom_dropdown.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

import '../../config/app_router.dart/routes.dart';
import '../../models/visa_info_model/visa_info_model.dart';
import '../../widgets/page_header.dart';

enum Gender { male, female }

enum MaritalStatus { single, married, widowed, separated, other }

class VisaPersonalInformation extends StatefulWidget {
  const VisaPersonalInformation({super.key});

  @override
  State<VisaPersonalInformation> createState() =>
      _VisaPersonalInformationState();
}

class _VisaPersonalInformationState extends State<VisaPersonalInformation> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _fullName = '';
  String _dob = '';
  String _cityOfBirth = '';
  String _countryOfBirth = '';
  String _nationality = '';
  String _dateOfNaturalization = '';
  String _placeOfNaturalization = '';
  String _formerNationality = '';

  Gender? _selectedGender;
  MaritalStatus? _selectedMaritalStatus;

  RegExp emailValidation =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp stringValidation = RegExp(r'^[a-zA-Z\s]+$');
  RegExp dateValidation = RegExp(r'^\d{2}/\d{2}/\d{4}$');

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
                const PageHeader(title: "Personal Information"),
                const SizedBox(height: 60),
                Text(
                  "Upload an image of the last page of your passport",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppMargin.m12),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryFeildColor,
                        ),
                        height: 150,
                        child: const Center(
                            child: Icon(
                          Icons.cloud_upload_outlined,
                          color: AppColors.fieldTextColor,
                        ))),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Email Address",
                  label: "Email Address",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!emailValidation.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
                CustomTextField(
                  hint: "Name in Full",
                  label: "Name in Full",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                  onSaved: (value) => _fullName = value!,
                ),
                CustomDropdown<Gender>(
                  dataList: Gender.values,
                  hint: 'Select your gender',
                  label: 'Gender',
                  displayText: (gender) {
                    switch (gender) {
                      case Gender.male:
                        return 'Male';
                      case Gender.female:
                        return 'Female';
                      default:
                        return '';
                    }
                  },
                  onChanged: (selectedGender) {
                    setState(() {
                      _selectedGender = selectedGender;
                    });
                  },
                  selectedItem: _selectedGender?.toString(),
                ),
                CustomTextField(
                  hint: "dd/mm/yyyy",
                  label: "Date of Birth",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    } else if (!dateValidation.hasMatch(value)) {
                      return 'Please enter a valid date in dd/mm/yyyy format';
                    }
                    return null;
                  },
                  onSaved: (value) => _dob = value!,
                ),
                CustomTextField(
                  hint: "City of birth",
                  label: "City of birth",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city of birth';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid city name';
                    }
                    return null;
                  },
                  onSaved: (value) => _cityOfBirth = value!,
                ),
                CustomTextField(
                  hint: "Country of birth",
                  label: "Country of birth",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country of birth';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid country name';
                    }
                    return null;
                  },
                  onSaved: (value) => _countryOfBirth = value!,
                ),
                CustomTextField(
                  hint: "Nationality",
                  label: "Nationality",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your nationality';
                    } else if (!stringValidation.hasMatch(value)) {
                      return 'Please enter a valid nationality';
                    }
                    return null;
                  },
                  onSaved: (value) => _nationality = value!,
                ),
                CustomDropdown<MaritalStatus>(
                  dataList: MaritalStatus.values,
                  hint: 'Select your current Marital Status',
                  label: 'Marital Status',
                  displayText: (maritalStatus) {
                    switch (maritalStatus) {
                      case MaritalStatus.single:
                        return 'Single';
                      case MaritalStatus.married:
                        return 'Married';
                      case MaritalStatus.widowed:
                        return 'Widowed';
                      case MaritalStatus.separated:
                        return 'Separated';
                      case MaritalStatus.other:
                        return 'Other';
                      default:
                        return '';
                    }
                  },
                  onChanged: (selectedStatus) {
                    setState(() {
                      _selectedMaritalStatus = selectedStatus;
                    });
                  },
                  selectedItem: _selectedMaritalStatus?.toString(),
                ),
                const SizedBox(height: 40),
                Text("Naturalization Information",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please provide the following details if you have been naturalized:",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  hint: "dd/mm/yyyy",
                  label: "Date of Naturalization",
                  validator: (value) {
                    if (!dateValidation.hasMatch(value!)) {
                      return 'Please enter a valid date';
                    }
                    return null;
                  },
                  onSaved: (value) => _dateOfNaturalization = value!,
                ),
                CustomTextField(
                  hint: "Place of Naturalization",
                  label: "Place of Naturalization",
                  validator: (value) {
                    if (!stringValidation.hasMatch(value!)) {
                      return 'Please enter a valid place of naturalization';
                    }
                    return null;
                  },
                  onSaved: (value) => _placeOfNaturalization = value!,
                ),
                CustomTextField(
                  hint: "Former Nationality",
                  label: "Former Nationality",
                  validator: (value) {
                    if (!stringValidation.hasMatch(value!)) {
                      return 'Please enter a valid former nationality';
                    }
                    return null;
                  },
                  onSaved: (value) => _formerNationality = value!,
                ),
                const SizedBox(height: 50),
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
                    const Spacer(),
                    BlocBuilder<VisaCubit, VisaInfoState>(
                      builder: (context, state) {
                        if (state is GetVisaInfoState) {
                          return CustomButton(
                            text: "Next",
                            styleType: ButtonStyleType.solid,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                final updatedVisaInfo = VisaInfoModel(
                                  // user: _fullName,
                                  emailAddress: _email,
                                  dateOfBirth: _dob,
                                  placeOfBirth: _cityOfBirth,
                                  currentAddress: _countryOfBirth,
                                  nationality: _nationality,
                                  //  dateOfNaturalization = _dateOfNaturalization,
                                  // placeOfNaturalization = _placeOfNaturalization,
                                  // formerNationality = _formerNationality;
                                );
                                context.read<VisaCubit>().updateUserInfo(
                                    _fullName,
                                    _email,
                                    _dob,
                                    _cityOfBirth,
                                    _countryOfBirth,
                                    _nationality);

                                GoRouter.of(context).pushNamed(
                                    Routes.presentPassportDetails,
                                    extra: updatedVisaInfo);
                              }
                            },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
