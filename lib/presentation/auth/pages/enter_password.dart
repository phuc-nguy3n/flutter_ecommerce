import 'package:e_commerce/common/bloc/button/button_state.dart';
import 'package:e_commerce/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:e_commerce/presentation/auth/pages/forgot_password.dart';
import 'package:e_commerce/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({required this.signinReq, super.key});

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: BlocProvider(
          // Comment to explantion
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },

            // Comment to explantion
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                const SizedBox(height: 20),
                _passwordTextField(context),
                const SizedBox(height: 20),
                _continueButton(context),
                const SizedBox(height: 20),
                _forgotPassword((context)),
              ],
            ),
          ),
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

  Widget _passwordTextField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: signinReq,
            );
          },
          title: 'Continue',
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Forgot password? ",
            style: TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: 'Reset it',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, ForgotPassword());
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
