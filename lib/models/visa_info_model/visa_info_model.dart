import 'package:json_annotation/json_annotation.dart';

part 'visa_info_model.g.dart';

@JsonSerializable()
class VisaInfoModel {
  final String? nationality;
  final String? gender;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? currentAddress;
  final String? mobileNumber;
  final String? emailAddress;
  final String? profession;
  final String? employerAddress;
  final String? passportImage;
  final String? passportNumber;
  final String? placeOfIssue;
  final String? dateOfIssue;
  final String? dateOfExpiry;
  final String? prevPassportNumber;
  final String? prevPlaceOfIssue;
  final String? prevDateOfIssue;
  final String? prevDateOfExpiry;
  final String? emergencyContactName;
  final String? emergencyContactAddress;
  final String? emergencyContactPhone;
  final String? emergencyContactRelationship;
  final String? emergencyContactOpName;
  final String? emergencyContactOpAddress;
  final String? emergencyContactOpPhone;
  final String? emergencyContactOpRelationship;
  final String? visaObjective;
  final String? routeAndMode;
  final String? addressStay;
  final String? periodOfStay;
  final String? rejectedPermission;
  final double? money;
  final String? cardName;
  final String? fingerprint;

  const VisaInfoModel({
    this.dateOfBirth,
    this.nationality,
    this.gender,
    this.placeOfBirth,
    this.currentAddress,
    this.mobileNumber,
    this.emailAddress,
    this.profession,
    this.employerAddress,
    this.passportImage,
    this.passportNumber,
    this.placeOfIssue,
    this.dateOfIssue,
    this.dateOfExpiry,
    this.prevPassportNumber,
    this.prevPlaceOfIssue,
    this.prevDateOfIssue,
    this.prevDateOfExpiry,
    this.emergencyContactName,
    this.emergencyContactAddress,
    this.emergencyContactPhone,
    this.emergencyContactRelationship,
    this.emergencyContactOpName,
    this.emergencyContactOpAddress,
    this.emergencyContactOpPhone,
    this.emergencyContactOpRelationship,
    this.visaObjective,
    this.routeAndMode,
    this.addressStay,
    this.periodOfStay,
    this.rejectedPermission,
    this.money,
    this.cardName,
    this.fingerprint,
  });

  // Factory constructor for creating a new VisaInfoModel from a map.
  factory VisaInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VisaInfoModelFromJson(json);

  // Method to convert VisaInfoModel into a JSON object.
  Map<String, dynamic> toJson() => _$VisaInfoModelToJson(this);
}
