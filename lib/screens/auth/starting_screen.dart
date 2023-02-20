import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/screens/auth/login/view/signin_screen.dart';

import '../../core/constant.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: kTransparent,
                radius: 120,
                // ignore: sort_child_properties_last
                child: Image.asset(
                  logo,
                ),
              ),
              Text(
                'Watchlux',
                style: GoogleFonts.oswald(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 300,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      'Welcome to Watchlux',
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kWhitecolor),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SigninScreen());
                      },
                      child: Container(
                        height: 58,
                        width: 350,
                        decoration: BoxDecoration(
                          color: kWhitecolor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          child: Text(
                            'Get start for free',
                            style: textStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
