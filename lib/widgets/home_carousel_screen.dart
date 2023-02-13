import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:watchlux/core/constant.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: kBackgroundclr),
      child: CarouselSlider(
        items: [
          Image.network(
            'https://m.media-amazon.com/images/G/31/img22/Wearables/Ptron_X12S/1400x800_Shop-Now._CB616080147_.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://m.media-amazon.com/images/G/31/img22/Wearables/Dizo_D2/1400x800_r1._CB615267599_.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://m.media-amazon.com/images/G/31/img22/Wearables/Boat-wave-call/1400_x_800._CB614620612_.jpg',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://m.media-amazon.com/images/G/31/img22/Wearables/Noise_GPS/1400x800-2._CB616080979_.gif',
            fit: BoxFit.cover,
          )
        ],
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
