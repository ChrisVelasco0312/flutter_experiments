import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BuilderForm extends StatefulWidget {
  const BuilderForm({super.key});

  @override
  State<BuilderForm> createState() => _BuilderFormState();
}

class _BuilderFormState extends State<BuilderForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<String> genderOptions = ['male', 'female', 'other'];

  void _onSubmit() {
    // Validate and save the form values
    _formKey.currentState?.saveAndValidate();
    final currentValue = _formKey.currentState?.value;
    debugPrint('$currentValue');
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'with flutter form builder',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: "Este campo es requerido",
                ),
              ]),
              onChanged: (value) => {debugPrint('${value!.split(' ')}')},
            ),
            const SizedBox(
              height: 16,
            ),
            FormBuilderDropdown(
              name: 'gender',
              initialValue: 'male',
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Gender',
                hintText: 'Select gender',
                border: OutlineInputBorder(),
              ),
              items: genderOptions
                  .map(
                    (gender) => DropdownMenuItem(
                      alignment: Alignment.center,
                      value: gender,
                      child: Text(
                        gender,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            FormBuilderTextField(
              name: 'id_number',
              decoration: const InputDecoration(
                labelText: 'Identity',
                border: OutlineInputBorder(),
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: "Este campo es requerido",
                  ),
                  FormBuilderValidators.integer()
                ],
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
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
