// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_gen/main.dart';

typedef IntRangeSelector = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // randomizerProvider.notifier - to access RandomizerStateNotifier
    final randomizer = ref.read(randomizerProvider.notifier);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RangeTextFormField(
              labelText: 'minimum',
              intValueSetter: (value) => randomizer.setMin(value),
            ),
            const SizedBox(
              height: 20,
            ),
            RangeTextFormField(
              labelText: 'maximum',
              intValueSetter: (value) => randomizer.setMax(value),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeTextFormField extends StatelessWidget {
  const RangeTextFormField({
    required this.labelText,
    required this.intValueSetter,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final IntRangeSelector intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'You must type some number';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
