// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class RandomGeneratorPage extends StatefulWidget {
  int min, max;
  RandomGeneratorPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  State<RandomGeneratorPage> createState() => _RandomGeneratorPageState();
}

class _RandomGeneratorPageState extends State<RandomGeneratorPage> {
  int? _randomNumber;
  final randomize = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _randomNumber = widget.min + randomize.nextInt(widget.max + 1 - widget.min);
          });
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
            _randomNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
