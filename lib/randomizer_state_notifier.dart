import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'randomizer_state_notifier.freezed.dart';

//Immutable state management.
//Always separate actual state from the class witch changes/updates the state.
//Since this is just simple state witch is not async(http request , server connections itp...
//RandomizerState is just simple DataClass but as soon as introduce async code witch Future ,
//Streams itp.. then use freezed unions - need cases for initial state, loading state,
//loaded state , errors ...  ).
//
//Witch immutable state management I have only one field 'state' that changes and other fields
//are inside single dataClass and they can't be changed directly - only by creating new copy
//of them - newer directly - this is the core principle of immutable state management.

//Command to generate freezed dataClass
// flutter pub run build_runner watch --delete-conflicting-outputs
@freezed
class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedNumber,
  }) = _RandomizerState;
}

class RandomizerStateNotifier extends StateNotifier<RandomizerState> {
  RandomizerStateNotifier() : super(const RandomizerState());
  //Avoid use properties in StateNotifier - it's possible but use only methods.
  //set min(int value) => _min = value; - DON'T DO THAT'.
  //properties - not || methods - yes.

  final _randomMath = Random();

  void generateRandomNumber() {
    state = state.copyWith(
        generatedNumber:
            state.min + (_randomMath.nextInt(state.max + 1 - state.min)));
  }

  void setMin(int value) {
    state = state.copyWith(min: value);
  }

  void setMax(int value) {
    state = state.copyWith(max: value);
  }
}
//
//
//
//Old RandomizerChangeNotifier class - now two separated classes - first for immutable State , second
//for StateNotifier.
//
// class RandomizerChangeNotifier extends ChangeNotifier {
//   final _randomMath = Random();

//   int min = 0, max = 0;

//   int? _generatedNumber;

//   int? get randomNumber => _generatedNumber;

//   void generateRandomNumber() {
//     _generatedNumber = min + (_randomMath.nextInt(max + 1 - min));

//     notifyListeners();
//   }
// }
