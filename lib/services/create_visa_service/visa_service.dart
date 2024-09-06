import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

import '../../constants/urls.dart';
import '../../models/response_model/response.dart';

part 'visa_service.g.dart';

@RestApi(baseUrl: local)
abstract class VisaServiceApi {
  factory VisaServiceApi(Dio dio) = _VisaServiceApi;

  @POST("/visa_app")
  Future<HttpResponse<ResponseModel>> createVisa(
    @Header("Authorization") String token,
    @Body() VisaInfoModel visaModel,
  );

  //  @POST("/login")
  // Future<String> register(
  //   @Body() RegisterInfoModel visaModel,
  // );

  // when implenting this in the screen

  // Future<String> registerUser(RegisterObj obj) async {
  //   final result = registerService.register(obj);
  //   if(result != null){
  //     // set the returning token to the singleton
  //   }
  // }
}
