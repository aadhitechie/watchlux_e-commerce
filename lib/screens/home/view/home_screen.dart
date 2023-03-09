import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';
import 'package:watchlux/widgets/category_screen.dart';
import 'package:watchlux/widgets/home_product_grid.dart';
import '../../../widgets/home_carousel_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  double width = Get.width;
  double height = Get.height;
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: homeController,
        builder: (controller) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselScreen(
                    homeController: homeController,
                    height: height,
                    width: width,
                  ),
                  const Divider(),
                  Text(
                    'The brands',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  CategoryScreen(
                    height: height,
                    homeController: homeController,
                  ),
                  const Divider(),
                  Text(
                    'Premium Products',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  HomeProductGrid(width: width, height: height)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
