import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BuilderForm extends StatefulWidget {
  const BuilderForm({super.key});

  @override
  State<BuilderForm> createState() => _BuilderFormState();
}

class _BuilderFormState extends State<BuilderForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();

  void _onSubmit() async {
// Validate and save the form values

    debugPrint('errors: ${_formKey.currentState!.isValid}');
    if (_formKey.currentState!.isValid) {
      _formKey.currentState?.saveAndValidate();
      debugPrint(_formKey.currentState?.value.toString());
    } else {
      debugPrint('executed');
      _formKey.currentState?.fields['name']?.invalidate('Email already taken');
      _nameFieldKey.currentState?.invalidate('NOT ALLOWED');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'with flutter form builder',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              key: _nameFieldKey,
              name: 'name',
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
              onPressed: _onSubmit,
              color: Theme.of(context).colorScheme.secondary,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
