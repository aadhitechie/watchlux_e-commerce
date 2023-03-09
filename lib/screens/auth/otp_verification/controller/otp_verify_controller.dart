import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:watchlux/screens/bottom%20nav/view/bottom_nav_screen.dart';

import '../../../../core/constant.dart';
import '../../sign_up/model/signup_model.dart';
import '../../sign_up/services/signup_service.dart';
import '../service/otp_service/verify_otp_service.dart';

class OtpVerifyController extends GetxController {
  VerifyOtpService verifyOtpService = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode);
    code = submitCode;
    update();
  }

  void submitOtp(SignUpModel model, code) {
    if (code.length != 4) {
      Get.snackbar(
        'OTP',
        'Please enter the otp',
        backgroundColor: kBlackcolor,
        colorText: kWhitecolor,
      );
    } else {
      isLoading = true;
      update();
      verifyOtpService.verifyOtp(model.email, code).then(
        (value) {
          if (value != null) {
            SignupServices().signupUser(model).then((value) {
              if (value != null) {
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Get.offAll(BottomNavScreen());
                isLoading = false;
                update();
              }
            });
          }
        },
      );
    }
  }
}
