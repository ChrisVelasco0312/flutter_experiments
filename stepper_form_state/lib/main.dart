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

  int _currentStep = 0;
  final List<Widget> _steps = [
    const Step1Screen(),
    const Step2Screen(),
    const Step3Screen()
  ];

  void _goToNextStep() {
    setState(() {
      if (_currentStep < _steps.length - 1) {
        _currentStep++;
      }
    });
  }

  void _goToPreviousStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  void goToStep(int stepIndex) {
    _pageController.animateToPage(
      stepIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: _steps),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _currentStep > 0
                    ? () {
                        _goToPreviousStep();
                        goToStep(_currentStep);
                      }
                    : null,
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: _currentStep < _steps.length - 1
                    ? () {
                        _goToNextStep();
                        goToStep(_currentStep);
                      }
                    : null,
                child: const Text('Next'),
              )
            ],
          )),
    );
  }
}
