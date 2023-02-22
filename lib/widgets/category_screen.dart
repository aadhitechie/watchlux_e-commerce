import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchlux/common/api_base_url.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key?key, required this.height, required this.homeController}):super(key: key);

  final double height;
  double width = Get.size.width;
final ApiBaseUrl apiBaseUrl = ApiBaseUrl();
final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: height * 0.13,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          homeController.categoryList.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                // alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(backgroundColor: kWhitecolor,
                    backgroundImage: NetworkImage('${apiBaseUrl.baseUrl}/category/${homeController.categoryList[index].image}'),radius: 30,),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    homeController.categoryList[index].name,
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
