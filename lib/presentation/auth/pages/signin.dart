import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20),
            _emailTextField(context),
            const SizedBox(height: 20),
            _continueButton(),
            const SizedBox(height: 20),
            _createAccount((context)),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign In',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      onPressed: () {},
      title: 'Continue',
      height: 50,
      width: double.infinity,
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have an account? ",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'Create one',

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
