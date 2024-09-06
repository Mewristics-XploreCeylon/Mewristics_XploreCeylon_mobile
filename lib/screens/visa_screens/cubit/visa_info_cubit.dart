import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

import '../../../models/response_model/response.dart';
import '../../../resources/R.dart';
import '../../../services/create_visa_service/visa_service.dart';
import 'visa_info_state.dart';

// part 'visa_info_state.dart';

class VisaCubit extends Cubit<VisaInfoState> {
  VisaServiceApi? visaApiService = VisaServiceApi(Dio());
  VisaCubit(this.visaApiService)
      : super(const GetVisaInfoState(populatedVisaInfo: VisaInfoModel()));

  Future<void> createVisa(VisaInfoModel visaInfo, BuildContext context) async {
    try {
      // replace the token with singleton token
      final httpResponse = await visaApiService!.createVisa(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmRiMmNlZjEyZjg2YWI5Yzg4OWFiODkiLCJpYXQiOjE3MjU2Mzk5MzgsImV4cCI6MTcyNTY0MzUzOH0.iXceaKGLRj-lqjV_0L1FEbyHbcM04bBLKDWvMorhO3I',
          visaInfo);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Visa Created'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (error) {
      const SnackBar(
        content: Text('Visa creation failed'),
        duration: Duration(seconds: 1),
      );
    }
  }

  void updateUserInfo(String name, String email, String dob, String pob,
      String currentAddress, String nationality) {
    final currentState = state;
    if (currentState is GetVisaInfoState) {
      final visaInfo = VisaInfoModel(
        // user: name,
        emailAddress: email,
        dateOfBirth: dob,
        placeOfBirth: pob,
        currentAddress: currentAddress,
        nationality: nationality,
      );
      final updateState = currentState.copyWith(visaInfo: visaInfo);
      emit(GetVisaInfoState(populatedVisaInfo: updateState.populatedVisaInfo));
    }
  }

  void updatePresentPassportInfo(String _passportNumber, String placeOfIssue,
      String dateOfIssue, String dateOfExpiry) {
    final currentState = state;
    final visaInfo = VisaInfoModel(
        // user: state.visaInfo.user,
        emailAddress: state.visaInfo.emailAddress,
        dateOfBirth: state.visaInfo.dateOfBirth,
        placeOfBirth: state.visaInfo.placeOfBirth,
        currentAddress: state.visaInfo.currentAddress,
        nationality: state.visaInfo.nationality,
        passportNumber: _passportNumber,
        placeOfIssue: placeOfIssue,
        dateOfIssue: dateOfIssue,
        dateOfExpiry: dateOfExpiry);

    if (currentState is GetVisaInfoState) {
      final updateState = currentState.copyWith(visaInfo: visaInfo);
      emit(GetVisaInfoState(populatedVisaInfo: updateState.populatedVisaInfo));
    }
  }

  void updatePastPassportInfo(String _passportNumber, String placeOfIssue,
      String dateOfIssue, String dateOfExpiry) {
    final currentState = state;
    final visaInfo = VisaInfoModel(
        // user: state.visaInfo.user,
        emailAddress: state.visaInfo.emailAddress,
        dateOfBirth: state.visaInfo.dateOfBirth,
        placeOfBirth: state.visaInfo.placeOfBirth,
        currentAddress: state.visaInfo.currentAddress,
        nationality: state.visaInfo.nationality,
        passportNumber: state.visaInfo.passportNumber,
        placeOfIssue: state.visaInfo.placeOfIssue,
        dateOfIssue: state.visaInfo.dateOfIssue,
        dateOfExpiry: state.visaInfo.dateOfExpiry,
        prevPassportNumber: _passportNumber,
        prevPlaceOfIssue: placeOfIssue,
        prevDateOfIssue: dateOfIssue,
        prevDateOfExpiry: dateOfExpiry);

    if (currentState is GetVisaInfoState) {
      final updateState = currentState.copyWith(visaInfo: visaInfo);
      emit(GetVisaInfoState(populatedVisaInfo: updateState.populatedVisaInfo));
    }
  }

  void updateEmergencyInfo(String _passportNumber, String placeOfIssue,
      String dateOfIssue, String dateOfExpiry) {
    final currentState = state;
    final visaInfo = VisaInfoModel(
        // user: state.visaInfo.user,
        emailAddress: state.visaInfo.emailAddress,
        dateOfBirth: state.visaInfo.dateOfBirth,
        placeOfBirth: state.visaInfo.placeOfBirth,
        currentAddress: state.visaInfo.currentAddress,
        nationality: state.visaInfo.nationality,
        passportNumber: state.visaInfo.passportNumber,
        placeOfIssue: state.visaInfo.placeOfIssue,
        dateOfIssue: state.visaInfo.dateOfIssue,
        dateOfExpiry: state.visaInfo.dateOfExpiry,
        prevPassportNumber: _passportNumber,
        prevPlaceOfIssue: placeOfIssue,
        prevDateOfIssue: dateOfIssue,
        prevDateOfExpiry: dateOfExpiry);

    if (currentState is GetVisaInfoState) {
      final updateState = currentState.copyWith(visaInfo: visaInfo);
      emit(GetVisaInfoState(populatedVisaInfo: updateState.populatedVisaInfo));
    }
  }

  void updateVisaDetailsInfo(String _passportNumber, String placeOfIssue,
      String dateOfIssue, String dateOfExpiry) {
    final currentState = state;
    final visaInfo = VisaInfoModel(
        // user: state.visaInfo.user,
        emailAddress: state.visaInfo.emailAddress,
        dateOfBirth: state.visaInfo.dateOfBirth,
        placeOfBirth: state.visaInfo.placeOfBirth,
        currentAddress: state.visaInfo.currentAddress,
        nationality: state.visaInfo.nationality,
        passportNumber: state.visaInfo.passportNumber,
        placeOfIssue: state.visaInfo.placeOfIssue,
        dateOfIssue: state.visaInfo.dateOfIssue,
        dateOfExpiry: state.visaInfo.dateOfExpiry,
        prevPassportNumber: _passportNumber,
        prevPlaceOfIssue: placeOfIssue,
        prevDateOfIssue: dateOfIssue,
        prevDateOfExpiry: dateOfExpiry);

    if (currentState is GetVisaInfoState) {
      final updateState = currentState.copyWith(visaInfo: visaInfo);
      emit(GetVisaInfoState(populatedVisaInfo: updateState.populatedVisaInfo));
    }
  }
}
