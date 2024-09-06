import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xploreceylon_mobile/constants/urls.dart';
import 'package:xploreceylon_mobile/models/user_model/user_mode.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: local)
abstract class AuthServiceApi {
  factory AuthServiceApi(Dio dio) = _AuthServiceApi;

  @POST("/auth/register")
  Future<HttpResponse<String>> registerUser(
    @Body() UserModel user,
  );

  @POST("/auth/login")
  Future<HttpResponse<String>> loginUser(
    @Body() UserModel user,
  );
}
