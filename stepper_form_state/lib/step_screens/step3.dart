import 'package:flutter/material.dart';

class Step3Screen extends StatelessWidget {
  final Function(int) goToStep;

  const Step3Screen({super.key, required this.goToStep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Step 3 Content'),
          OutlinedButton(
            onPressed: () {
              goToStep(1);
            },
            child: const Text('Go To Second Page'),
          )
        ],
      )),
    );
  }
}
