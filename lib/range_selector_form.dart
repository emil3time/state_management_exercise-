// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

typedef IntRangeSelector = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minRangeSelector,
    required this.maxRangeSelector,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  IntRangeSelector minRangeSelector;
  IntRangeSelector maxRangeSelector;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RangeTextFormField(
              labelText: 'minimum',
              intValueSetter: minRangeSelector,
            ),
            const SizedBox(
              height: 20,
            ),
            RangeTextFormField(
              labelText: 'maximum',
              intValueSetter: maxRangeSelector,
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
  final void Function(int value) intValueSetter;

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
