import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_gen/randomizer_change_notifier.dart';

class RandomGeneratorPage extends StatelessWidget {
  const RandomGeneratorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();

        },
        label: const Text(
          'Generate',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) => Text(
          notifier.randomNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 40),
          ),
        )),
      ),
    );
  }
}
