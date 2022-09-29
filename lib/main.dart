import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_gen/randomizer_change_notifier.dart';

import 'range_selector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        home: RangeSelectorPage(),
      ),
    );
  }
}
