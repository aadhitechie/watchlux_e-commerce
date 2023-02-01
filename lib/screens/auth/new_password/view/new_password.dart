import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/auth/new_password/controller/new_password_controller.dart';
import 'package:watchlux/screens/auth/sign_in/view/signin_screen.dart';
import 'package:watchlux/widgets/my_button.dart';

import '../../../../widgets/my_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  final newpasswordController = Get.put(NewPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: Column(
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
                ' new password',
                style: TextStyle(
                    color: kBlackcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' here',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          MyTextField(
            validator: (value) =>
                newpasswordController.passwordValdation(value),
            controller: newpasswordController.passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          MyTextField(
            validator: (value) =>
                newpasswordController.confirmpasswordValdation(value),
            controller: newpasswordController.confirmpasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          const SizedBox(height: 40),
          MyButton(
              onTap: () {
                Get.to(() => SigninScreen());
              },
              text: 'Done')
        ],
      ),
    );
  }
}
