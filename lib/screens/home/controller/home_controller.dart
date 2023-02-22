import 'dart:developer';

import 'package:get/get.dart';
import 'package:watchlux/screens/home/model/carousel_model.dart';
import 'package:watchlux/screens/home/model/category_model.dart';
import 'package:watchlux/screens/home/model/product_model.dart';
import 'package:watchlux/screens/home/service/carousel_service.dart';
import 'package:watchlux/screens/home/service/category_service.dart';
import 'package:watchlux/screens/home/service/products_service.dart';

class HomeController extends GetxController {
  HomeController() {
    getCarousal();
    getCategory();
    getProduct();
  }
  bool isLoading = false;
  List<CarousalModel> carousalList = [];
  List<CategoryModel>categoryList = [];
  List<ProductModel>productList=[];
  CarousalService carouselS = CarousalService();
  CategoryService categoryS = CategoryService();
  void getCarousal() async {
    isLoading = true;
    update();
    await carouselS.getCarousal().then((value) {
      if (value != null) {
        carousalList = value;
        update();
        isLoading = false;
      } else {
        isLoading = false;
        update();
      }
    });
  }
  void getCategory() async {
    log('getcategory');
    isLoading = true;
    update();
    await categoryS.getCategory().then((value) {
      log('came category');
      if (value != null) {
        log('add category', name: 'category');
        categoryList = value;
        log(categoryList.toString(), name: 'categorylist');
        update();
        isLoading = false;
        update();
      } else {
        log('null value');
        isLoading = false;
        update();
        return null;
      }
    });
  }
 void  getProduct()async{
  log('product start');
  isLoading=true;
  update();
  await ProductService().getProduct().then((value) {
    if (value!=null) {
      log('product added');
      productList=value;
      update();
      isLoading=false;
      update();
    }
    else{
      isLoading=false;
      update();
    }
  });
 }
}
