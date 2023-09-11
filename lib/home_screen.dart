import 'package:flutter/material.dart';

import 'package:flutter_application_demo/services/network.dart';

import '../models/weather_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: NetworkService.getWetherData('London'),
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
                    'condition : ${snap.data?.current.condition.icon}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Temp (C) : ${snap.data!.current.tempC}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'City :${snap.data!.location.name}',
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.read<MainProvider>().increment(),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
