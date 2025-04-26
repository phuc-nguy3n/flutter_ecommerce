import 'package:e_commerce/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_images.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_price.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_quantity.dart';
import 'package:e_commerce/presentation/product_detail/widgets/product_title.dart';
import 'package:e_commerce/presentation/product_detail/widgets/selected_color.dart';
import 'package:e_commerce/presentation/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),

        BlocProvider(create: (context) => ProductColorSelectionCubit()),

        BlocProvider(create: (context) => ProductSizeSelectionCubit()),

        BlocProvider(create: (context) => ButtonStateCubit()),
      ],
      child: Scaffold(
        appBar: BasicAppbar(hideBack: false),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductTitle(productEntity: productEntity),
              const SizedBox(height: 10),
              ProductPrice(productEntity: productEntity),
              const SizedBox(height: 20),
              SelectedSize(productEntity: productEntity),
              const SizedBox(height: 15),
              SelectedColor(productEntity: productEntity),
              const SizedBox(height: 15),
              ProductQuantity(productEntity: productEntity),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
