import 'package:get/get.dart';
import 'package:watchlux/screens/home/view/home_screen.dart';
import 'package:watchlux/screens/wishlist/view/wishilist_screen.dart';

import '../../cart/view/cart_screen.dart';
import '../../profile/view/profile_screen.dart';

class BottomNavContoller extends GetxController {
  List pages = [
    const HomeScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];
  onTabChanged(index) {
    print(index);
  }

  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  set currentIndex(index) {
    _currentIndex = index;
    update();
  }

  void gotoHomescreen() {
    currentIndex = 0;
    update();
  }
}
