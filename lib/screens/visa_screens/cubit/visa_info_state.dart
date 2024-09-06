import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

// part 'visa_info_cubit.dart';

abstract class VisaCubitState extends Equatable {
  final VisaInfoModel? visaInfo;
  final DioException? error;
  const VisaCubitState(this.visaInfo, this.error);

  @override
  List<Object?> get props => [visaInfo, error];
}

class VisaCubitInitial extends VisaCubitState {
  const VisaCubitInitial({VisaInfoModel? visaInfo, DioException? error})
      : super(visaInfo, error);
}

class VisaCubitLoading extends VisaCubitState {
  const VisaCubitLoading({VisaInfoModel? visaInfo, DioException? error})
      : super(visaInfo, error);
}

class VisaCubitLoaded extends VisaCubitState {
  const VisaCubitLoaded({VisaInfoModel? visaInfo, DioException? error})
      : super(visaInfo, error);
}

class VisaCubitError extends VisaCubitState {
  const VisaCubitError({VisaInfoModel? visaInfo, DioException? error})
      : super(visaInfo, error);
}


