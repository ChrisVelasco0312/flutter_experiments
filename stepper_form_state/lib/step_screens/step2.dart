import 'package:flutter/material.dart';

class Step2Screen extends StatelessWidget {
  final Function(int) goToStep;
  const Step2Screen({super.key, required this.goToStep});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Step 2 Content')),
    );
  }
}
