import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/auth/forgot_password/controller/forgot_pasword_controller.dart';
import 'package:watchlux/screens/auth/forgot_password/view/forgot_otp.dart';
import 'package:watchlux/widgets/my_button.dart';
import 'package:watchlux/widgets/my_textfield.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final formkey = GlobalKey<FormState>();
  final forgotPasswordController = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: GetBuilder<ForgotPasswordController>(
        builder: (controller) => SafeArea(
            child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Watchlux',
                    style: GoogleFonts.oswald(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.watch)
                ],
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You can',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    ' Reset your password',
                    style: TextStyle(
                        color: kBlackcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' from here',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: SizedBox(
                  width: 350,
                  child: Text(
                    'Enter the email and click the submit button to get notification on your mail',
                    style: TextStyle(fontSize: 15, color: kGreyColor),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MyTextField(
                controller: forgotPasswordController.resetemailController,
                hintText: 'Enter you email here',
                obscureText: false,
                validator: (value) =>
                    forgotPasswordController.resetemailValdation(value),
              ),
              const SizedBox(height: 30),
              MyButton(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    log('mail');
                  }
                  Get.to(() => ForgotOtpScreen());
                },
                text: 'Submit',
              )
            ],
          ),
        )),
      ),
    );
  }
}
