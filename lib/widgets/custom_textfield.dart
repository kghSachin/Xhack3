import 'package:flutter/material.dart';
import 'package:frontend/widgets/global_variables.dart';

class CustomTextfield extends StatelessWidget {
  final String labelText;
  const CustomTextfield({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: GlobalVariables.primaryColor)),
          ),
        ),
      ],
    );
  }
}
