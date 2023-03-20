import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchlux/screens/wishlist/controller/wishlist_controller.dart';
import 'package:watchlux/screens/wishlist/view/wishlist_grid_tile.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});
  final wishlistcontroller = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: wishlistcontroller,
          builder: (controller) {
            return wishlistcontroller.isLoading == true
                ?const  CircularProgressIndicator()
                : wishlistcontroller.wmodel == null ||
                        wishlistcontroller.wmodel!.products.isEmpty
                    ?const SizedBox(
                        child: Center(
                          child: Text('Wishlist is empty'),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: wishlistcontroller.wmodel!.products.length,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                          itemBuilder: (context, index) => WishlistGridTile(
                            controller: wishlistcontroller,
                            index: index,
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
