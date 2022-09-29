import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:random_gen/random_generator_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  //flutter hooks implementation description on  the next page.
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();

              if (min.value >= max.value) return;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) =>
                      RandomGeneratorPage(min: min.value, max: max.value)),
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
          minRangeSelector: (value) => min.value = value,
          maxRangeSelector: (value) => max.value = value,
        ));
  }
}
