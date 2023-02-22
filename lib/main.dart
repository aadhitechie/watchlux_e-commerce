import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchlux/screens/auth/splace_screen/view/splash_screen.dart';
import 'package:watchlux/screens/bottom%20nav/view/bottom_nav_screen.dart';
import 'package:watchlux/screens/product_view/view/product_view.dart';
import 'package:watchlux/widgets/home_carousel_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductViewScreen(),
    );
  }
}
