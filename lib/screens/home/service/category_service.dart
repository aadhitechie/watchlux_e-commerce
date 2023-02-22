import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:watchlux/common/api_endpoint.dart';
import '../../../common/api_base_url.dart';
import '../../../utils/dio_exception.dart';
import '../../../utils/dio_intreceptor.dart';
import '../model/category_model.dart';


class CategoryService {
  final apibaseUrl = ApiBaseUrl();

  Future<List<CategoryModel>?> getCategory() async {
    log('came service');
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + ApiEndPoints.category);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString(),name: 'responce');
        final List<CategoryModel> listCategory = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        log('set category');

        return listCategory;
      } else {
        return null;
      }
    } on DioError catch (e) {
      // log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}