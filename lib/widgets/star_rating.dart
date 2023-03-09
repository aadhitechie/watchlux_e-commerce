import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watchlux/screens/home/model/product_model.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.controller});
final ProductModel controller;
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: RatingBar.builder(
              itemSize: 15,
              initialRating: double.parse(controller.rating),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          );
  }
}