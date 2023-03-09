import 'package:get/get.dart';

class ProductController extends GetxController {
  int activeCarousal = 0;

  void changeCarousalPosition(index) {
    activeCarousal = index;
    update();
  }
}