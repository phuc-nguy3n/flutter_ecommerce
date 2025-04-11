import 'package:e_commerce/core/configs/theme/app_theme.dart';
import 'package:e_commerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
