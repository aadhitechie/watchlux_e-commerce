import 'dart:async';

import 'package:get/get.dart';
import 'package:watchlux/screens/auth/starting_screen.dart';

class SplashController extends GetxController {
  void splashTimer() {
    Timer(const Duration(seconds: 3), () async {
      Get.off(() => const StartingScreen());
    });
  }
}
