import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  // WeatherModel  _data = WeatherModel();
  // WeatherModel get data => _data;

  // void fetchData(String city) async {
  //   _isLoading = true;
  //   NetworkService.getWetherData(city).then((value) => _data = value).catchError(onError);
  // }
}
