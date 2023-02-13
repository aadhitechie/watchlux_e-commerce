import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../common/api_base_url.dart';
import '../../../../common/api_endpoint.dart';
import '../../../../utils/dio_exception.dart';
import '../../sign_up/model/signup_model.dart';
import '../../sign_up/model/signup_token.dart';

class ForgotPassOtpService {
  Dio dio = Dio();

  Future<SignUpTokenModel?> signupUser(
      SignUpModel value, BuildContext context) async {
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
}
