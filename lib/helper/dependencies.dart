import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/location_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../controllers/user_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/location_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/user_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(
      () => ApiClient(
          appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
      fenix: true);

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => UserRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()), fenix: true);
  Get.lazyPut(() => UserController(userRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()),
      fenix: true);
  Get.lazyPut(
    () => RecommendedProductController(recommendedProductRepo: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
      () => CartController(
            cartRepo: Get.find(),
          ),
      fenix: true);
  Get.lazyPut(() => LocationController(locationRepo: Get.find()), fenix: true);
}
