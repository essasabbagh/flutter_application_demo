import 'package:flutter/widgets.dart';

import 'package:dio/dio.dart';

import 'package:flutter_application_demo/services/storage_service.dart';

import '../constants.dart';
import '../models/geo_model.dart';

const cityKey = 'city';

class GeoService {
  static Future<String> getCityName() async {
    try {
      final city = StorageService().read(cityKey);

      if (city.isNotEmpty) return city;

      final dio = Dio(BaseOptions(
        baseUrl: geolocationBaseUrl,
        receiveTimeout: const Duration(milliseconds: timeout),
        connectTimeout: const Duration(milliseconds: timeout),
        sendTimeout: const Duration(milliseconds: timeout),
        followRedirects: false,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
      ));

      final res = await dio.get('');
      debugPrint('res: $res');
      if (res.statusCode != 200) throw res.statusMessage ?? 'No Data !!';

      final geoInfo = GeoModel.fromJson(res.data);
      StorageService().write(cityKey, geoInfo.city);
      return geoInfo.city ?? '';
    } on DioException catch (e) {
      debugPrint('e: $e');
      return '';
    }
  }
}
