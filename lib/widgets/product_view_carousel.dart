import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchlux/common/api_base_url.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';
import 'package:watchlux/screens/home/model/product_model.dart';

class ProductViewCarousel extends StatelessWidget {
   ProductViewCarousel(
      {super.key, required this.height, required this.width, required this.prodmodel});
  final double height;
  final double width;
  final ProductModel prodmodel;
  final apibaseurl = ApiBaseUrl();
  final homecontroller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: height * 0.5,
            aspectRatio: 1 / 4,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: width * 0.95,
              height: height * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: kWhitecolor,
                image: DecorationImage(
                  image: NetworkImage(
                      '${apibaseurl.baseUrl}/products/${prodmodel.image[index]}'),
                ),
              ),
            );
          },
          itemCount: prodmodel.image.length,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Text('In Stock',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
