// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visa_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisaInfoModel _$VisaInfoModelFromJson(Map<String, dynamic> json) =>
    VisaInfoModel(
      dateOfBirth: json['dateOfBirth'] as String?,
      user: json['user'] as String?,
      nationality: json['nationality'] as String?,
      gender: json['gender'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      currentAddress: json['currentAddress'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      profession: json['profession'] as String?,
      employerAddress: json['employerAddress'] as String?,
      passportImage: json['passportImage'] as String?,
      passportNumber: json['passportNumber'] as String?,
      placeOfIssue: json['placeOfIssue'] as String?,
      dateOfIssue: json['dateOfIssue'] as String?,
      dateOfExpiry: json['dateOfExpiry'] as String?,
      prevPassportNumber: json['prevPassportNumber'] as String?,
      prevPlaceOfIssue: json['prevPlaceOfIssue'] as String?,
      prevDateOfIssue: json['prevDateOfIssue'] as String?,
      prevDateOfExpiry: json['prevDateOfExpiry'] as String?,
      emergencyContactName: json['emergencyContactName'] as String?,
      emergencyContactAddress: json['emergencyContactAddress'] as String?,
      emergencyContactPhone: json['emergencyContactPhone'] as String?,
      emergencyContactRelationship:
          json['emergencyContactRelationship'] as String?,
      emergencyContactOpName: json['emergencyContactOpName'] as String?,
      emergencyContactOpAddress: json['emergencyContactOpAddress'] as String?,
      emergencyContactOpPhone: json['emergencyContactOpPhone'] as String?,
      emergencyContactOpRelationship:
          json['emergencyContactOpRelationship'] as String?,
      visaObjective: json['visaObjective'] as String?,
      routeAndMode: json['routeAndMode'] as String?,
      addressStay: json['addressStay'] as String?,
      periodOfStay: json['periodOfStay'] as String?,
      rejectedPermission: json['rejectedPermission'] as String?,
      money: (json['money'] as num?)?.toDouble(),
      cardName: json['cardName'] as String?,
      fingerprint: json['fingerprint'] as String?,
    );

Map<String, dynamic> _$VisaInfoModelToJson(VisaInfoModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'placeOfBirth': instance.placeOfBirth,
      'currentAddress': instance.currentAddress,
      'mobileNumber': instance.mobileNumber,
      'emailAddress': instance.emailAddress,
      'profession': instance.profession,
      'employerAddress': instance.employerAddress,
      'passportImage': instance.passportImage,
      'passportNumber': instance.passportNumber,
      'placeOfIssue': instance.placeOfIssue,
      'dateOfIssue': instance.dateOfIssue,
      'dateOfExpiry': instance.dateOfExpiry,
      'prevPassportNumber': instance.prevPassportNumber,
      'prevPlaceOfIssue': instance.prevPlaceOfIssue,
      'prevDateOfIssue': instance.prevDateOfIssue,
      'prevDateOfExpiry': instance.prevDateOfExpiry,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactAddress': instance.emergencyContactAddress,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'emergencyContactRelationship': instance.emergencyContactRelationship,
      'emergencyContactOpName': instance.emergencyContactOpName,
      'emergencyContactOpAddress': instance.emergencyContactOpAddress,
      'emergencyContactOpPhone': instance.emergencyContactOpPhone,
      'emergencyContactOpRelationship': instance.emergencyContactOpRelationship,
      'visaObjective': instance.visaObjective,
      'routeAndMode': instance.routeAndMode,
      'addressStay': instance.addressStay,
      'periodOfStay': instance.periodOfStay,
      'rejectedPermission': instance.rejectedPermission,
      'money': instance.money,
      'cardName': instance.cardName,
      'fingerprint': instance.fingerprint,
    };
