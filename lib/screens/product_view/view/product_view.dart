import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/view/home_screen.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({
    super.key,
    //
    //required this.hieght,
    //required this.weight
  });
  // final double hieght;
  // final double weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundclr,
      appBar: AppBar(
        title: Text(
          'Product name',
          style: TextStyle(color: kBlackcolor),
          textAlign: TextAlign.start,
        ),
        backgroundColor: kBackgroundclr,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: FloatingActionButton(
              backgroundColor: kBackgroundclr,
              elevation: 0,
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: kBlackcolor,
              ),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: RatingBar.builder(
              itemSize: 20,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          )
        ],
      ),
      body: SafeArea(child: Text('Product view')),
    );
  }
}
