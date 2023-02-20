import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchlux/core/constant.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.height});

  final double height;
  double width = Get.size.width;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.19,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                // alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage('https://images-workbench.99static.com/49sz9cRILfJeKRgtezbtD7g_1JY=/99designs-contests-attachments/48/48941/attachment_48941398'),radius: 30,),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'items',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: kBlackcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
