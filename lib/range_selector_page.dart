import 'package:flutter/material.dart';

import 'package:random_gen/random_generator_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const RandomGeneratorPage()),
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
        ));
  }
}
