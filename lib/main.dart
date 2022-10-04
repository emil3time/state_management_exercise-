import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_gen/randomizer_state_notifier.dart';

import 'range_selector_page.dart';

void main() {
  runApp(const MyApp());
}
// StateNotifierProvider always requires generic type <T> - for StateNotifier and State
final randomizerProvider =
    StateNotifierProvider<RandomizerStateNotifier, RandomizerState>(
        ((ref) => RandomizerStateNotifier()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: RangeSelectorPage(),
      ),
    );
  }
}
