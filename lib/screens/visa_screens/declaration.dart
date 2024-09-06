import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/cubit/visa_info_cubit.dart';
import 'package:xploreceylon_mobile/screens/visa_screens/visa_personal_information.dart';
import 'package:xploreceylon_mobile/services/create_visa_info.dart';
import 'package:xploreceylon_mobile/services/create_visa_service/visa_service.dart';
import 'package:xploreceylon_mobile/widgets/custom_appbar.dart';
import 'package:xploreceylon_mobile/widgets/custom_checkbutton.dart';

import '../../config/app_router.dart/routes.dart';
import '../../constants/sizes.dart';
import '../../models/visa_info_model/visa_info_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/page_header.dart';

class Declaration extends StatelessWidget {
  const Declaration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m24, vertical: AppMargin.m24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: "Declaration",
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                  "Read the declaration and, if accepted, press your finger against the scanner to capture a clear imprint.",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 50,
              ),
              const Center(
                  child: Image(
                      image: AssetImage("assets/images/fingerprint.png"))),
              const SizedBox(
                height: 50,
              ),
              Text(
                  "I hereby declare that to the best of my knowledge and belief the foregoing statements are true, that I shall not engage in any employment, paid or unpaid, or in any business or trade other than the purpose for which the visa is granted.\n\nI shall leave Sri Lanka before the expiry of my authorized stay and will notify the Controller of Immigration & Emigration, Colombo, immediately of any change in my address while in Sri Lanka.",
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
              CustomCheckButton(
                  label: "Read and understood ",
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CustomButton(
                    text: "Next",
                    styleType: ButtonStyleType.solid,
                    onPressed: () {
                      final _apiService = VisaServiceApi(Dio());

                      const dummyVisaInfo = VisaInfoModel(
                        // user: 'JohnDoe',
                        nationality: 'American',
                        gender: 'Male',
                        dateOfBirth: '1990-01-01',
                        placeOfBirth: 'New York, USA',
                        currentAddress: '123 Elm Street, Springfield, USA',
                        mobileNumber: '+1-234-567-8901',
                        emailAddress: 'johndoe@example.com',
                        profession: 'Software Developer',
                        employerAddress: '456 Tech Park, Silicon Valley, USA',
                        passportImage: 'path/to/passport/image.jpg',
                        passportNumber: '123456789',
                        placeOfIssue: 'New York, USA',
                        dateOfIssue: '2020-01-01',
                        dateOfExpiry: '2030-01-01',
                        prevPassportNumber: '987654321',
                        prevPlaceOfIssue: 'Los Angeles, USA',
                        prevDateOfIssue: '2010-01-01',
                        prevDateOfExpiry: '2020-01-01',
                        emergencyContactName: 'Jane Doe',
                        emergencyContactAddress:
                            '789 Oak Street, Springfield, USA',
                        emergencyContactPhone: '+1-234-567-8902',
                        emergencyContactRelationship: 'Sister',
                        emergencyContactOpName: 'Dr. Smith',
                        emergencyContactOpAddress:
                            '101 Health Center, Springfield, USA',
                        emergencyContactOpPhone: '+1-234-567-8903',
                        emergencyContactOpRelationship: 'Doctor',
                        visaObjective: 'Tourism',
                        routeAndMode: 'Flight',
                        addressStay: '789 Oak Street, Springfield, USA',
                        periodOfStay: '2 weeks',
                        rejectedPermission: 'No',
                        money: 5000.00,
                        cardName: 'Visa Platinum',
                        fingerprint: 'fingerprint_data_here',
                      );

                      final visaCubit = VisaCubit(_apiService)
                        ..createVisa(dummyVisaInfo, context);

                      // GoRouter.of(context).pushNamed(Routes.visaApplicationFee);
                    }),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
