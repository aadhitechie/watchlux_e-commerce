import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:watchlux/common/api_endpoint.dart';
import '../../../common/api_base_url.dart';
import '../../../utils/dio_exception.dart';
import '../../../utils/dio_intreceptor.dart';
import '../model/carousel_model.dart';


class CarousalService {
  final apibaseUrl = ApiBaseUrl();
  Future<List<CarousalModel>?> getCarousal() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response =
          await dio.get(apibaseUrl.baseUrl + ApiEndPoints.carousal);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<CarousalModel> carousalList = (response.data as List)
            .map((e) => CarousalModel.fromJson(e))
            .toList();
        return carousalList;
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