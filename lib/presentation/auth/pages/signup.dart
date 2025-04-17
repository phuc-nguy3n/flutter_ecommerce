import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';
import 'package:e_commerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:e_commerce/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signupText(context),
              const SizedBox(height: 20),
              _firstNameTextField(context),
              const SizedBox(height: 20),
              _lasNameTextField(context),
              const SizedBox(height: 20),
              _emailTextField(context),
              const SizedBox(height: 20),
              _passwordTextField(context),
              const SizedBox(height: 20),
              _continueButton(context),
              const SizedBox(height: 20),
              _haveAccount((context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameTextField(BuildContext context) {
    return TextField(
      controller: _firstNameCon,
      decoration: InputDecoration(
        hintText: 'First Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _lasNameTextField(BuildContext context) {
    return TextField(
      controller: _lastNameCon,
      decoration: InputDecoration(
        hintText: 'Last Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameCon.text,
              email: _emailCon.text,
              lastName: _lastNameCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
      title: 'Continue',
      height: 50,
      width: double.infinity,
    );
  }

  Widget _haveAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Do you have account? ",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'Sign in',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SigninPage());
                  },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
