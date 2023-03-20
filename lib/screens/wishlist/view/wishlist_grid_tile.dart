import 'package:flutter/material.dart';
import 'package:watchlux/common/api_base_url.dart';
import 'package:watchlux/screens/wishlist/controller/wishlist_controller.dart';

class WishlistGridTile extends StatelessWidget {
  const WishlistGridTile({super.key,required this.controller,required this.index});
final WishlistController controller;
final int index;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network('${ApiBaseUrl().baseUrl}/products/${controller.wmodel!.products[index].product.image[0]}',fit: BoxFit.fill,),
      footer:  GridTileBar(backgroundColor: Colors.black54,title:const Text('wishlisted'),
        trailing: InkWell(child: const Icon(Icons.favorite),onTap: (){controller.addOrRemoveWishlist(controller.wmodel!.products[index].product.id);},),
      ),
    );
  }
}
