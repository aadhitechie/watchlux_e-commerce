import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:watchlux/screens/cart/view/cart_screen.dart';

// ignore: must_be_immutable
class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  BottomNavContoller bottomnavcontroller = Get.put(BottomNavContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundclr,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'watchlux',
              style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kBlackcolor),
            ),
          ],
        ),
     actions: [Padding(
       padding: const EdgeInsets.all(8.0),
       child: InkWell(onTap: (){Get.to(()=>CartScreen());},
        child: Icon(Icons.shopping_cart_outlined,color: kBlackcolor,)),
     )], ),
      body: GetBuilder<BottomNavContoller>(builder: (controller) {
        return bottomnavcontroller.pages[bottomnavcontroller.currentIndex];
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          backgroundColor: kTransparent,
          color: themeColor,
          hoverColor: kGreyColor,
          tabBackgroundColor: Colors.grey.shade300,
          padding: const EdgeInsets.all(16),
          onTabChange: (value) => bottomnavcontroller.bottomNav(value),
          tabs: const [
            GButton(
              gap: 8,
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              gap: 8,
              icon: Icons.category_outlined,
              text: 'Category',
            ),
            GButton(
              gap: 8,
              icon: Icons.favorite_border_outlined,
              text: 'Wishlist',
            ),
            GButton(
              gap: 8,
              icon: Icons.person_2_outlined,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
