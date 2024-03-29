// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_delivery/pages/payment/payment_page.dart';
import 'package:food_delivery/utils/colors.dart';

import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';

import 'helper/dependencies.dart' as dep;
import 'helper/notification_helper.dart';
import 'models/order_model.dart';
import 'routes/route_helper.dart';

// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   print(
//       "onBackground: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
Future<void> main() async {
  // setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await dep.init();

  // try {
  //   if (GetPlatform.isMobile) {
  //     final RemoteMessage? remoteMessage =
  //         await FirebaseMessaging.instance.getInitialMessage();
  //     await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  //     FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  //   }
  // } catch (e) {
  //   if (kDebugMode) {
  //     print(e.toString());
  //   }
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: SignInPage(),
          // home: PaymentPage(
          //     orderModel: OrderModel(
          //   id: int.parse(100034.toString()),
          //   userId: int.parse(23.toString()),
          // )),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,

          theme:
              ThemeData(primaryColor: AppColors.mainColor, fontFamily: "Lato"),
        );
      });
    });
  }
}
