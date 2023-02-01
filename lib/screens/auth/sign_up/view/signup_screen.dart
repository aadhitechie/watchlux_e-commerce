import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/auth/sign_in/view/signin_screen.dart';
import 'package:watchlux/screens/auth/sign_up/controller/signup_controller.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formkey = GlobalKey<FormState>();
  final signupController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: GetBuilder<SignUpController>(
        builder: (controller) => SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 50),

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
                          ' Register',
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

                    const SizedBox(height: 25),

                    // username textfield
                    MyTextField(
                      validator: (value) =>
                          signupController.usernameValidation(value),
                      controller: signupController.usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),

                    MyTextField(
                      keyboardtype: TextInputType.number,
                      validator: (value) =>
                          signupController.phoneValdation(value),
                      controller: signupController.phoneController,
                      hintText: 'Phone number',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      keyboardtype: TextInputType.emailAddress,
                      validator: (value) =>
                          signupController.emailValdation(value),
                      controller: signupController.emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 20),

                    // password textfield
                    MyTextField(
                      obscureText: signupController.obscureText,
                      validator: (value) =>
                          signupController.passwordValdation(value),
                      controller: signupController.passwordController,
                      hintText: 'Password',
                      suffixicon: IconButton(
                        onPressed: () {
                          signupController.visibility();
                        },
                        icon: signupController.icon,
                        color: kBlackcolor,
                      ),
                    ),

                    const SizedBox(height: 20),
                    MyTextField(
                      obscureText: signupController.obscureText,
                      validator: (value) =>
                          signupController.confirmpasswordValdation(value),
                      controller: signupController.confirmpasswordController,
                      hintText: 'Confirm Password',
                      suffixicon: IconButton(
                        onPressed: () {
                          signupController.visibility();
                        },
                        icon: signupController.icon,
                        color: kBlackcolor,
                      ),
                    ),

                    const SizedBox(height: 35),
                    MyButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          log('Hello');
                        }
                      },
                    ),
                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Get.to(() => SigninScreen());
                          },
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
