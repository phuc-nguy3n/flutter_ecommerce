import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/product/models/product.dart';
import 'package:e_commerce/data/product/source/product_firebase_service.dart';
import 'package:e_commerce/domain/product/entities/product.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) {
    // TODO: implement addOrRemoveFavoriteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either> getFavoritesProducts() {
    // TODO: implement getFavoritesProducts
    throw UnimplementedError();
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) {
    // TODO: implement getProductsByCategoryId
    throw UnimplementedError();
  }

  @override
  Future<Either> getProductsByTitle(String title) {
    // TODO: implement getProductsByTitle
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavorite(String productId) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }
}
