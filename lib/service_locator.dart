import 'package:e_commerce/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/domain/auth/usecases/siginup.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services - Giao tiếp tầng thấp (API, Firebase...)	T
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories - Cầu nối giữa UseCase và Service
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases - Logic nghiệp vụ
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
