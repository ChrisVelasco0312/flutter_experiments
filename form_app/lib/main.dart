import 'package:flutter/material.dart';
import 'package:form_app/builder_form.dart';
// import 'package:form_app/vainilla_form.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FORM EXAMPLES',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              // VainillaForm(),
              BuilderForm()
            ],
          ),
        ),
      ),
    ),
  );
}
