import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        productEntity.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
