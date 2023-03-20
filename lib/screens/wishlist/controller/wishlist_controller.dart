import 'package:get/get.dart';
import 'package:watchlux/screens/wishlist/model/wishlist_model.dart';
import 'package:watchlux/screens/wishlist/service/wishlist_service.dart';

class WishlistController extends GetxController {
  WishlistController() {
    getWishlist();
  }
  bool isLoading = false;
  WishlistModel? wmodel;
  List<dynamic> wishList = [];
  void addOrRemoveWishlist(String productId) async {
    isLoading = true;
    update();
    await WishlistService().addOrRemoveWishlist(productId).then((value) {
      if (value != null) {
        getWishlist();
        if (value == 201) {
          Get.snackbar('Added', 'Product added to wishlist');
        } else if (value == 204) {
          Get.snackbar('Removed', 'Product removed to wishlist');
        }
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }

  void getWishlist() async {
    isLoading = true;
    update();
    await WishlistService().getWishlist().then(
      (value) {
        if (value != null) {
          wmodel = value;
          update();
          wishList = wmodel!.products.map((e) => e.product.id).toList();
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }
}
