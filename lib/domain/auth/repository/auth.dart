import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
}


// Repository trong folder domain
// Chứa class abstract (khai báo)
// Chỉ định các phương thức mà repository cần phải có
// Không quan tâm data đến từ đâu
// Được các UseCase sử dụng