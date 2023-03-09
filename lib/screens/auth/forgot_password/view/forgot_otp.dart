import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/auth/forgot_password/view/forgot_password.dart';
import 'package:watchlux/screens/auth/new_password/view/new_password.dart';
import 'package:watchlux/widgets/my_button.dart';

class ForgotOtpScreen extends StatelessWidget {
  const ForgotOtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'watchlux',
                style: GoogleFonts.oswald(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.watch)
            ],
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const Text(
                ' otp',
                style: TextStyle(
                    color: kBlackcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' here for reset the password',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: OtpTextField(
              focusedBorderColor: themeColor,
              margin: const EdgeInsets.only(right: 20.0),
              fieldWidth: 50,
              numberOfFields: 4,
              fillColor: kBlackcolor.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: (value) {
                log('the otp is $value');
              },
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
              child: MyButton(
                  onTap: () {
                    Get.to(() => NewPasswordScreen());
                  },
                  text: 'Continue')),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.to(() => ForgotPassword());
            },
            child: const Text(
              'Resend the otp',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
