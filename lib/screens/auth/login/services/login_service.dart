import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../common/api_base_url.dart';
import '../../../../common/api_endpoint.dart';
import '../../../../utils/dio_exception.dart';
import '../model/login_model.dart';
import '../model/login_token.dart';

class LoginService {
  Dio dio = Dio();
  Future<LoginTokenModel?> loginUser(
      LoginModel value, BuildContext context) async {
    try {
      Response response = await dio.post(
          ApiBaseUrl().baseUrl + ApiEndPoints.logIn,
          data: jsonEncode(value.toJson()));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final loginModel = LoginTokenModel.fromJson(response.data);
        log(response.data.toString());
        return loginModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
