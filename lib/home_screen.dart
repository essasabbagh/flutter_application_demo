import 'package:flutter/material.dart';

import 'package:flutter_application_demo/services/geo_service.dart';

import 'models/weather_model.dart';
import 'services/weather_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherModel> getData() async {
    try {
      final cityName = await GeoService.getCityName();
      // final cityName = 'Cairo';

      if (cityName.isEmpty) throw 'City not found !!';

      final info = await WeatherService.getWeatherData(cityName);

      return info;
    } on Exception {
      throw 'City not found !!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<WeatherModel> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snap.hasError) {
              return Center(
                child: Text(snap.error.toString()),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'City :${snap.data!.location.name}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Temp (C) : ${snap.data!.current.tempC}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'condition : ${snap.data?.current.condition.text}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
