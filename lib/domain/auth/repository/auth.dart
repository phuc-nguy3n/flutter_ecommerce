import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}


// Repository trong folder domain
// Chứa class abstract (khai báo)
// Chỉ định các phương thức mà repository cần phải có
// Không quan tâm data đến từ đâu
// Được các UseCase sử dụng

