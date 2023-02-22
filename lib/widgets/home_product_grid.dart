import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:watchlux/common/api_base_url.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';

class HomeProductGrid extends StatelessWidget {
 HomeProductGrid({super.key, required this.width, required this.height});
  final double width;
  final double height;
  final apibaseurl =ApiBaseUrl();
  final homecontroller =Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 1 / 1.5),
            itemBuilder: (BuildContext ctx, int index) {
              return SizedBox(
                // width: width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: width * 0.5,
                              height: height * 0.20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kTransparent,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${apibaseurl.baseUrl}/products/${homecontroller.productList[index].image[0]}'),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        homecontroller.productList[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                      kHeight10,
                      Row(
                        children: [
                          Text(
                            homecontroller.productList[index].price.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: homecontroller.productList.length);
      }
    );
  }
}
