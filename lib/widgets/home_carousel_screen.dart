import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';

class CarouselScreen extends StatelessWidget {
  CarouselScreen(
      {super.key, required this.homeController, required this.width, required this.height});
  final HomeController homeController;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: kTransparent),
      child: CarouselSlider.builder(
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: width,
                      height: height * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhitecolor,
                        image: DecorationImage(
                          image: NetworkImage(
                              ''),
                          // fit: BoxFit.cover,
                        ),
                      ),);
        },
        itemCount: homeController.carousalList.length,
        options: CarouselOptions(
          height: Get.height * 0.30,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
