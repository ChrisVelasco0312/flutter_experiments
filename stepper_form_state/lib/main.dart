import 'package:flutter/material.dart';
import 'package:stepper_form_state/step_screens/step1.dart';
import 'package:stepper_form_state/step_screens/step2.dart';
import 'package:stepper_form_state/step_screens/step3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Stepper',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StepperApp(),
    );
  }
}

class StepperApp extends StatefulWidget {
  const StepperApp({super.key});

  @override
  State<StepperApp> createState() => _StepperAppState();
}

class _StepperAppState extends State<StepperApp> {
  final PageController _pageController = PageController(initialPage: 0);

  late List<Widget> _steps;

  int _currentStep = 0;

  void _goToStep(int stepIndex) {
    _pageController.animateToPage(
      stepIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _steps = [
      Step1Screen(goToStep: _goToStep),
      Step2Screen(goToStep: _goToStep),
      Step3Screen(goToStep: _goToStep),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _steps,
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _currentStep > 0
                    ? () {
                        setState(() {
                          _currentStep--;
                        });
                        _goToStep(_currentStep);
                      }
                    : null,
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: _currentStep < _steps.length - 1
                    ? () {
                        setState(() {
                          _currentStep++;
                        });
                        _goToStep(_currentStep);
                      }
                    : null,
                child: const Text('Next'),
              )
            ],
          )),
    );
  }
}
