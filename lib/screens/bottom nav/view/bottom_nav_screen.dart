import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:watchlux/core/constant.dart';
import 'package:watchlux/screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:watchlux/screens/cart/view/cart_screen.dart';
import 'package:watchlux/screens/home/view/home_screen.dart';
import 'package:watchlux/screens/profile/view/profile_screen.dart';
import 'package:watchlux/screens/wishlist/view/wishilist_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final bottomnavcontroller = Get.put(BottomNavContoller());
  final currentIndex = 0;
  List pages = [
    HomeScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];
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
      body: pages[bottomnavcontroller.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: GNav(
          backgroundColor: Colors.transparent,
          color: themeColor,
          hoverColor: kGreyColor,
          tabBackgroundColor: Colors.grey.shade300,
          padding: const EdgeInsets.all(16),
          onTabChange: bottomnavcontroller.onTabChanged,
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
