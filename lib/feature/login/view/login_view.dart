import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/components/text/app_string.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  bool isValidate = false;
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: context.verticalPaddingHigh,
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.highValue,
                ),
                Text(AppString.welcomeText, style: Theme.of(context).textTheme.headlineSmall),
                Text(
                  AppString.designText,
                  style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: context.normalValue,
                ),
                _buildForm(context),
                _forgotPasswordText(),
                SizedBox(
                  height: context.normalValue,
                ),
                _elevatedButton(),
                SizedBox(
                  height: context.dynamicHeight(0.2),
                ),
                _buttonText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _emailTextFormField(context),
            _passwordTextFormField(context),
          ],
        ));
  }

  Padding _emailTextFormField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppString.emailValidationText;
          }
          return null;
        },
        controller: _mailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: AppString.emailText,
          border: OutlineInputBorder(),
        ),
        focusNode: _emailNode,
      ),
    );
  }

  Padding _passwordTextFormField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppString.passwordValidationText;
          }
          return null;
        },
        obscureText: isPasswordVisible,
        focusNode: _passwordNode,
        controller: _passwordController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: AppString.passwordText,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              isPasswordVisible = !isPasswordVisible;
            }),
            icon: isPasswordVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Align _forgotPasswordText() =>
      Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: Text(AppString.forgotPasswordText)));

  Center _elevatedButton() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppString.successText)));
        }
      },
      child: const Text(AppString.loginButtonText),
      style: ElevatedButton.styleFrom(fixedSize: const Size(350, 60)),
    ));
  }

  Row _buttonText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(AppString.dontHaveAccountText), TextButton(onPressed: () {}, child: Text(AppString.createText))],
    );
  }
}
