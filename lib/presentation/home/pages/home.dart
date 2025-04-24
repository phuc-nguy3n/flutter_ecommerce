import 'package:e_commerce/presentation/home/widget/categories.dart';
import 'package:e_commerce/presentation/home/widget/header.dart';
import 'package:e_commerce/presentation/home/widget/new_in.dart';
import 'package:e_commerce/presentation/home/widget/search_field.dart';
import 'package:e_commerce/presentation/home/widget/top_selling.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24),
            SearchField(),
            SizedBox(height: 24),
            Categories(),
            SizedBox(height: 24),
            TopSelling(),
            SizedBox(height: 24),
            NewIn(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
