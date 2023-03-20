import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watchlux/common/api_endpoint.dart';
import 'package:watchlux/screens/wishlist/model/wishlist_model.dart';

import '../../../common/api_base_url.dart';
import '../../../utils/dio_exception.dart';
import '../../../utils/dio_intreceptor.dart';

class WishlistService {
  final apibaseUrl = ApiBaseUrl();
  Future<int?> addOrRemoveWishlist(productId) async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.post(apibaseUrl.baseUrl + ApiEndPoints.wishlist, data: {
        'product': productId,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString(), name: 'wishlist 201');
        return response.statusCode;
      } else if (response.statusCode == 204) {
        log(response.statusCode.toString(), name: 'wishlist 204');
        return response.statusCode;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }

  Future<WishlistModel?> getWishlist() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(apibaseUrl.baseUrl+ApiEndPoints.wishlist);

      if (response.statusCode==200||response.statusCode==201) {
       final getWishlist =  WishlistModel.fromJson(response.data);
        log(response.data.toString());
        return getWishlist;
      }

    } 
   on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
  return null;
  }
}
