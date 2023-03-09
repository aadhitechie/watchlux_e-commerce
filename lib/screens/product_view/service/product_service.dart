import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watchlux/common/api_base_url.dart';
import 'package:watchlux/common/api_endpoint.dart';
import 'package:watchlux/screens/home/model/product_model.dart';
import 'package:watchlux/utils/dio_intreceptor.dart';

import '../../../utils/dio_exception.dart';

class ProductService {
  final apibaseUrl = ApiBaseUrl();
  Future<List<ProductModel>?> getProduct() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(apibaseUrl.baseUrl + ApiEndPoints.product);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString(), name: 'product statuscode');
        log(response.data.toString());
        final List<ProductModel> productList = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();

        return productList;
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}