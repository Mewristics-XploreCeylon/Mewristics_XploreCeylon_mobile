import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
import 'package:xploreceylon_mobile/constants/sizes.dart';
import 'package:xploreceylon_mobile/widgets/custom_dropdown.dart';
import 'package:xploreceylon_mobile/widgets/custom_text_field.dart';

enum Gender { male, female, other }

class VisaPersonalInformation extends StatefulWidget {
  const VisaPersonalInformation({super.key});

  @override
  State<VisaPersonalInformation> createState() =>
      _VisaPersonalInformationState();
}

class _VisaPersonalInformationState extends State<VisaPersonalInformation> {
  Gender? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Information",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 60,
              ),
              Text("Upload an image of the last page your passport",
                  style: Theme.of(context).textTheme.headlineSmall),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppMargin.m4),
                child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryFeildColor,
                      ),
                      height: 150,
                      child: Center(
                          child: Icon(
                        Icons.cloud_upload_outlined,
                        color: AppColors.fieldTextColor,
                      ))),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(hint: "Nationality", label: "Nationality"),
              CustomDropdown<Gender>(
                dataList: Gender.values,
                hint: 'Select your gender',
                label: 'Gender',
                displayText: (gender) {
                  // Define how each enum value should be displayed
                  switch (gender) {
                    case Gender.male:
                      return 'Male';
                    case Gender.female:
                      return 'Female';
                    case Gender.other:
                      return 'Other';
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
                hint: "Place of birth",
                label: "Place of birth",
                iconButton: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.fieldTextColor,
                    ),
                    onPressed: () {}),
              ),
              CustomTextField(
                  hint: "Current Address", label: "Current Address"),
              CustomTextField(hint: "Mobile Number", label: "Mobile Number"),
              CustomTextField(hint: "Email", label: "Email"),
              CustomTextField(hint: "Profession", label: "Profession"),
              CustomTextField(
                  hint: "Address", label: "Address of the  employer/ business"),
            ],
          ),
        ),
      ),
    );
  }
}
