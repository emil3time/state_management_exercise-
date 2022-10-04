import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_gen/main.dart';

class RandomGeneratorPage extends ConsumerWidget {
  const RandomGeneratorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          // randomizerProvider.notifier - to access RandomizerStateNotifier
          ref.read(randomizerProvider.notifier).generateRandomNumber();
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
            // randomizerProvider - to access RandomizerState - to only watch actual state
            ref.watch(randomizerProvider).generatedNumber?.toString() ??
                'Generate a number',
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
