import 'package:flutter/material.dart';
import 'package:random_gen/random_generator_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();

              if (_min >= _max) return;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) =>
                      RandomGeneratorPage(min: _min, max: _max)),
                ),
              );
            }
          },
          child: const Icon(
            Icons.arrow_right,
            size: 60,
          ),
        ),
        appBar: AppBar(
          title: const Text('Select Range'),
        ),
        body: RangeSelectorForm(
          formKey: formKey,
          minRangeSelector: (value) => _min = value,
          maxRangeSelector: (value) => _max = value,
        ));
  }
}
