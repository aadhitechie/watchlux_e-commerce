import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/bottom%20nav/controller/bottom_nav_controller.dart';

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
              'Watchlux',
              style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kBlackcolor),
            ),
            const Icon(
              Icons.watch,
              color: kBlackcolor,
            )
          ],
        ),
      ),
      body:GetBuilder<BottomNavContoller>(builder: (controller){
        return bottomnavcontroller.pages[bottomnavcontroller.currentIndex];}) ,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          backgroundColor: Colors.transparent,
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
              icon: Icons.shopping_cart_outlined,
              text: 'Cart',
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
