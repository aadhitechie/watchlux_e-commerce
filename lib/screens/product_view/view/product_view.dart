import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/home/controller/home_controller.dart';
import 'package:watchlux/widgets/product_description.dart';
import 'package:watchlux/widgets/product_view_carousel.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen({
    super.key,
    required this.id,
  });
  final String id;
  final homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final findProductById = homecontroller.findById(id);
    return Scaffold(
      backgroundColor: kBackgroundclr,
      appBar: AppBar(
        title: Text(
          'watchlux',
          style: GoogleFonts.oswald(
              fontSize: 25, fontWeight: FontWeight.bold, color: kBlackcolor),
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
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ProductViewCarousel(
                  height: 600,
                  width: double.infinity,
                  prodmodel: findProductById,
                ),
              ),
              kHeight5,
              Padding(
                padding: EdgeInsets.all(3.0),
                child: ProductDescription(controlle: findProductById),
              ),
              const SizedBox(
                height: 280,
              ),
             
            ],
          )),
        );
      }),
      bottomNavigationBar:  BottomNavigationBar(
                  backgroundColor: kTransparent,
                  elevation: 0,
                  selectedItemColor: kBlackcolor,
                  unselectedItemColor: kBlackcolor,
                  selectedFontSize: 13,
                  unselectedFontSize: 13,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: 'Add to cart',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline),
                      label: 'Add to wishlist',
                    ),
                  ]),
    );
  }
}
