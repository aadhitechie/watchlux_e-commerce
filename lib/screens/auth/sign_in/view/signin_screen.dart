import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/auth/forgot_password/view/forgot_password.dart';
import 'package:watchlux/screens/auth/sign_in/controller/signin_controller.dart';
import 'package:watchlux/screens/auth/sign_up/view/signup_screen.dart';
import 'package:watchlux/widgets/square_tile.dart';

import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textfield.dart';

class SigninScreen extends StatelessWidget {
  double width = Get.size.width;
  double height = Get.size.height;
  SigninScreen({super.key});

  // text editing controllers
  final signinController = Get.put(SignInController());

  final formkey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: GetBuilder<SignInController>(
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
                          ' Login',
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
                      obscureText: false,
                      controller: signinController.emailController,
                      validator: (value) =>
                          signinController.emailValdation(value),
                      hintText: 'Email',
                    ),

                    const SizedBox(height: 20),

                    // password textfield
                    MyTextField(
                      suffixicon: IconButton(
                        onPressed: () {
                          signinController.visibility();
                        },
                        icon: signinController.icon,
                        color: kBlackcolor,
                      ),
                      validator: (value) =>
                          signinController.passwordValdation(value),
                      controller: signinController.passwordController,
                      hintText: 'Password',
                      obscureText: signinController.obscureText,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: themeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    MyButton(
                      text: 'Sign In',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          log('Hello');
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SquareTile(imagePath: 'assets/google.png'),
                      ],
                    ),

                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Get.to(() => SignupScreen());
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: themeColor,
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
