import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/weather_model.dart';

import 'client.dart';

class NetworkService {
  static Future<WeatherModel> getWetherData(String city) async {
    try {
      final res = await DioClient.instance.get('?key=$apiKey&q=$city&aqi=no');
      if (res.statusCode != 200) throw res.statusMessage ?? 'No Data !!';
      final postList = WeatherModel.fromJson(res.data);
      return postList;
    } on DioException catch (e) {
      final error = NetworkException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
