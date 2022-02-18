import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/components/text/app_string.dart';
import '../../../product/widget/custom_elevated_button.dart';
import '../../../product/widget/custom_text_form_field.dart';

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
        physics: _emailNode.hasFocus || _passwordNode.hasFocus ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: context.verticalPaddingHigh,
          child: Padding(
            padding: context.paddingNormal,
            child: _pageColumn(context),
          ),
        ),
      ),
    );
  }

  Column _pageColumn(BuildContext context) {
    return Column(
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

  Widget _emailTextFormField(BuildContext context) {
    return CustomTextFormField(
        formFieldController: _mailController, keyboardType: TextInputType.emailAddress, labelText: AppString.emailText, focusNode: _emailNode);
  }

  Padding _passwordTextFormField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
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
            icon: isPasswordVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Align _forgotPasswordText() =>
      Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text(AppString.forgotPasswordText)));

  Widget _elevatedButton() {
    return CustomElevatedButton(formKey: _formKey);
  }

  Row _buttonText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text(AppString.dontHaveAccountText), TextButton(onPressed: () {}, child: const Text(AppString.createText))],
    );
  }
}
