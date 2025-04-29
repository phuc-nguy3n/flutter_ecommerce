import 'package:e_commerce/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce/data/category/repository/category.dart';
import 'package:e_commerce/data/category/source/category_firebase_service.dart';
import 'package:e_commerce/data/order/repository/order.dart';
import 'package:e_commerce/data/order/source/order_firebase_service.dart';
import 'package:e_commerce/data/product/repository/product.dart';
import 'package:e_commerce/data/product/source/product_firebase_service.dart';
import 'package:e_commerce/domain/auth/repository/auth.dart';
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/domain/auth/usecases/get_user.dart';
import 'package:e_commerce/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:e_commerce/domain/auth/usecases/siginup.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:e_commerce/domain/category/repository/category.dart';
import 'package:e_commerce/domain/category/usecases/get_categories.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/domain/order/usecases/add_to_cart.dart';
import 'package:e_commerce/domain/order/usecases/get_cart_products.dart';
import 'package:e_commerce/domain/order/usecases/order_registration.dart';
import 'package:e_commerce/domain/order/usecases/remove_cart_product.dart';
import 'package:e_commerce/domain/product/repository/product.dart';
import 'package:e_commerce/domain/product/usecases/get_new_in.dart';
import 'package:e_commerce/domain/product/usecases/get_products_by_category_id.dart';
import 'package:e_commerce/domain/product/usecases/get_products_by_title.dart';
import 'package:e_commerce/domain/product/usecases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services - Giao tiếp tầng thấp (API, Firebase...)	T
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  // Repositories - Cầu nối giữa UseCase và Service
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  // Usecases - Logic nghiệp vụ
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());

  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());

  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase(),
  );

  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());

  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());

  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());

  sl.registerSingleton<RemoveCartProductUseCase>(RemoveCartProductUseCase());

  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
}
