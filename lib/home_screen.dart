import 'package:flutter/material.dart';

import 'package:flutter_application_demo/locale/generated/l10n.dart';
import 'package:flutter_application_demo/widgets/language_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).appName),
      ),
      body: const Center(
        child: LanguagePicker(),
      ),
    );
  }
}
