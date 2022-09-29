// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomGeneratorPage extends HookWidget {
  int min, max;

  final randomize = Random();

  RandomGeneratorPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // random number can be final because when use .value only changing state.
    final randomNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // no need for setState now
          randomNumber.value = min + randomize.nextInt(max + 1 - min);
        },
        label: const Text(
          'Generate',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            randomNumber.value?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  // createState is now useless.
  /* @override
  State<RandomGeneratorPage> createState() => _RandomGeneratorPageState(); */
}


 // Cut build method nad paste to HookWidget
/*
class _RandomGeneratorPageState extends State<RandomGeneratorPage> {
  int? _randomNumber;
}
 */