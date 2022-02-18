import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../components/text/app_string.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController formFieldController;
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;
  final FocusNode focusNode;

  const CustomTextFormField({
    Key? key,
    required this.formFieldController,
    required this.keyboardType,
    this.obscureText = false,
    required this.labelText,
    required this.focusNode,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        focusNode: widget.focusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppString.passwordValidationText;
          }
          return null;
        },
        controller: widget.formFieldController,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
