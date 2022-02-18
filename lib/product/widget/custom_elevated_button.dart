import 'package:flutter/material.dart';

import '../components/text/app_string.dart';

class CustomElevatedButton extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CustomElevatedButton({Key? key,required this.formKey}) : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        if (widget.formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppString.successText)));
        }
      },
      child: const Text(AppString.loginButtonText),
      style: ElevatedButton.styleFrom(fixedSize: const Size(350, 60)),
    ));
  }
}
