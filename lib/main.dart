import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/app.dart';

import 'observers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const MainApp(),
    ),
  );
}
