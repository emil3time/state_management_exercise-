import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final randomMath = Random();

  int min = 0, max = 0;

  int? _randomNumber;

  int? get randomNumber => _randomNumber;

  void generateRandomNumber() {
    _randomNumber = min + (randomMath.nextInt(max + 1 - min));

   notifyListeners();



  }
}
