import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../common/api_base_url.dart';
import '../../../../common/api_endpoint.dart';
import '../../../../utils/dio_exception.dart';
import '../../../../utils/dio_intreceptor.dart';
import '../model/signup_model.dart';
import '../model/signup_token.dart';

class SignupServices {
  Dio dio = Dio();

  Future<SignUpTokenModel?> signupUser(SignUpModel value) async {
    try {
      Response response = await dio.post(
        ApiBaseUrl().baseUrl + ApiEndPoints.signUp,
        data: jsonEncode(
          value.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final signupResponse = SignUpTokenModel.fromJson(response.data);
        log(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<SignUpModel?> getUser() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      final Response response = await dios.get(
        ApiBaseUrl().baseUrl + ApiEndPoints.signUp,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final SignUpModel model = SignUpModel.fromJson(response.data);

          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
