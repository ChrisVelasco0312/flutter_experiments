import 'package:flutter/material.dart';
import 'package:form_app/vainilla_form.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Form App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              VainillaForm()
            ],
          ),
        ),
      ),
    ),
  );
}
