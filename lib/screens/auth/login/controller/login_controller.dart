import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watchlux/screens/bottom%20nav/view/bottom_nav_screen.dart';

import '../../../../core/constant.dart';
import '../model/login_model.dart';
import '../services/login_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  LoginService loginService = LoginService();
  bool isLoading = false;
  void logIn(BuildContext context) {
    isLoading = true;
    update();
    final LoginModel loginModel = LoginModel(
      email: emailController.text,
      password: passController.text,
    );
    loginService.loginUser(loginModel, context).then(
      (value) async {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          await storage.write(
              key: 'email', value: emailController.text.toString());
          Get.offAll(BottomNavScreen());
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    update();
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: kBlackcolor,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: kBlackcolor,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: kBlackcolor,
      );
      obscureText = false;
      update();
    }
  }

  void disposeTextfield() {
    emailController.clear();
    passController.clear();
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }
}
