import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? validateEmpty(String? value, String? name) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $name';
  }
  return null;
}

class VainillaForm extends StatefulWidget {
  const VainillaForm({super.key});

  @override
  State<VainillaForm> createState() => _VainillaFormState();
}

class _VainillaFormState extends State<VainillaForm> {
  final _formKey = GlobalKey<FormState>();

  //controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _idController = TextEditingController();

  //variables for values
  String _name = '';
  String _email = '';
  String _id = '';

  // validation functions
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegex.hasMatch(value!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // real time on change validations methods
  void onEmailChange(value) {
    //remove spaces
    _emailController.text = value.replaceAll(' ', '');
    _emailController.selection = TextSelection.fromPosition(
      TextPosition(offset: _emailController.text.length),
    );
  }

  //submit handler
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_name');
      print('Email: $_email');
      print('Id: $_id');
    }
  }

  // override of dispose necessary to controller logic
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              controller: _nameController,
              validator: _validateName,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              onSaved: (value) => _name = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              controller: _emailController,
              validator: _validateEmail,
              onChanged: onEmailChange,
              onSaved: (value) => _email = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Identification',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              controller: _idController,
              validator: (value) => validateEmpty(value, 'id'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              onSaved: (value) => _id = value!,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
