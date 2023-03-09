import 'package:flutter/material.dart';


import '../core/constant.dart';

class ElevatedButtonDetailPage extends StatelessWidget {
  const ElevatedButtonDetailPage({super.key, required this.text, required this.ontap});
final String text;
final  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: ontap,
      child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: kWhitecolor,
                ),
                width: 400,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style:const TextStyle(color: kBlackcolor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}