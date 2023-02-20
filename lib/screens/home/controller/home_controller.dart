import 'package:get/get.dart';
import 'package:watchlux/screens/home/model/carousel_model.dart';
import 'package:watchlux/screens/home/service/carousel_service.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  List<CarousalModel> carousalList = [];
  CarousalService carouselS = CarousalService();
  void getCarousal() async {
    isLoading = true;
    update();
    await carouselS.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
        update();
        isLoading = false;
      }
      else{
        isLoading=false;
        update();
      }
    });
  }
}
