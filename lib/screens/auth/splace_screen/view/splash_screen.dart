import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashC = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashC.splashTimer();
    });
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Container(
              child: Lottie.asset('assets/splash.json',
                  repeat: true, animate: true),
            ),
          ),
        ],
      ),
    );
  }
}
