import 'package:get/get.dart';
import 'package:watchlux/screens/home/view/home_screen.dart';
import 'package:watchlux/screens/wishlist/view/wishilist_screen.dart';
import '../../cart/view/cart_screen.dart';
import '../../profile/view/profile_screen.dart';

class BottomNavContoller extends GetxController {
  int currentIndex = 0;
  List pages = [
    HomeScreen(),
   const  CartScreen(),
   const WishlistScreen(),
   const ProfileScreen(),
  ];
  
  void bottomNav(value) {
    currentIndex = value;
    update();
  }
}
