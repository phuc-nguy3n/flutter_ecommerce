import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  // Future<Either> getOrders();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var cartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart');

      // Kiểm tra xem sản phẩm đã tồn tại trong giỏ chưa
      var querySnapshot =
          await cartRef
              .where('productId', isEqualTo: addToCartReq.productId)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Nếu tồn tại -> cập nhật productQuantity
        var existingDoc = querySnapshot.docs.first;
        int currentQuantity = existingDoc.data()['productQuantity'] ?? 0;
        int newQuantity = currentQuantity + (addToCartReq.productQuantity ?? 1);

        await cartRef.doc(existingDoc.id).update({
          'productQuantity': newQuantity,
        });
      } else {
        // Nếu chưa có sản phẩm đó -> thêm mới
        await cartRef.add(addToCartReq.toMap());
      }

      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again.');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user!.uid)
              .collection('Cart')
              .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();
      return const Right('Product removed successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toMap());

      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return const Right('Order registered successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
