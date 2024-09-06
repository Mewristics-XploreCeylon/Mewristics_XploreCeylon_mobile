import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

import '../../../services/create_visa_info.dart';
import 'visa_info_state.dart';

// part 'visa_info_state.dart';

class VisaCubit extends Cubit<VisaCubitState> {
  final VisaService? visaService;

  VisaCubit(this.visaService) : super(const VisaCubitInitial());

  Future<void> createVisaInfo(VisaInfoModel visaInfoModel) async {
    emit(const VisaCubitLoading());

    try {
      final response = await visaService!.createNewVisa(visaInfoModel);
      emit(VisaCubitLoaded(visaInfo: visaInfoModel));
      print(response);
    } catch (e) {
      if (e is DioException) {
        emit(VisaCubitError(error: e));
      } else {
        emit(VisaCubitError(
            error: DioException(
          requestOptions: RequestOptions(path: ''),
          error: e.toString(),
        )));
      }
    }
  }

    void updateVisaInfo(VisaInfoModel updatedVisaInfo) {
    emit(VisaCubitLoaded(visaInfo: updatedVisaInfo));
  }
}
