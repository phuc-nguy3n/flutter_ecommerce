import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/product/entities/product.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection('Products')
              .where('salesNumber', isGreaterThanOrEqualTo: 20)
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
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
  Future<Either> getNewIn() {
    // TODO: implement getNewIn
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
