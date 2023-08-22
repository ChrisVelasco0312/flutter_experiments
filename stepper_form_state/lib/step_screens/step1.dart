import 'package:flutter/material.dart';

class Step1Screen extends StatelessWidget {
  final Function(int) goToStep;

  const Step1Screen({super.key, required this.goToStep});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Step 1 Content')),
    );
  }
}
