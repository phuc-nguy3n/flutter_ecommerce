import 'package:e_commerce/presentation/home/widget/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [Header(), SizedBox(height: 24)]),
      ),
    );
  }
}
