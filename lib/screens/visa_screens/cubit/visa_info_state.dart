import 'package:equatable/equatable.dart';
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

abstract class VisaInfoState extends Equatable {
  final VisaInfoModel visaInfo;
  const VisaInfoState({required this.visaInfo});

  @override
  List<Object?> get props => [visaInfo];
}

class VisaInfoInitial extends VisaInfoState {
  const VisaInfoInitial({required super.visaInfo});
}

class GetVisaInfoState extends VisaInfoState {
  final VisaInfoModel populatedVisaInfo;
  const GetVisaInfoState({required this.populatedVisaInfo})
      : super(visaInfo: populatedVisaInfo);

  @override
  List<Object?> get props => [populatedVisaInfo];

  GetVisaInfoState copyWith({VisaInfoModel? visaInfo}) {
    return GetVisaInfoState(
      populatedVisaInfo: visaInfo ?? this.visaInfo,
    );
  }
}

class VisaInfoError extends VisaInfoState {
  final String error;
  VisaInfoError({required this.error}) : super(visaInfo: VisaInfoModel());

  @override
  List<Object?> get props => [error];
}
