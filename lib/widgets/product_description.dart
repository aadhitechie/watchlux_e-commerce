import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/widgets/star_rating.dart';
import '../screens/home/model/product_model.dart';

class ProductDescription extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProductDescription({super.key, required this.controlle});
  final ProductModel controlle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ReadMoreText(
          controlle.description,
          style:const TextStyle(),
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          moreStyle:const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kGreyColor,
          ),
          lessStyle:const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kGreyColor,
          ),
        ),
        kHeight5,
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 5.0),
          child: StarRating(controller: controlle,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Text(
                'Offer ${controlle.offer}%',
                style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              kWidth10,
              Text(
                '₹ ${controlle.discountPrice}',
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            const  Text('/-')
            ],
          ),
        ),
        kHeight5,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'M.R.P :',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '₹ ${controlle.price}',
                  style: const TextStyle(
                      fontSize: 18, decoration: TextDecoration.lineThrough),
                ),
              ]),
        ),
        kHeight5,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Free delivery',
                  style: TextStyle(fontSize: 14),
                ),
              ]),
        ),
      ],
    );
  }
}
