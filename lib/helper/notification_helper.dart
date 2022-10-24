import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/order_controller.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';

class NotificationHelper {
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('notification_icon');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
          // Get.toNamed(RouterHelper.getNotificationRoute());
        } else {
          // Get.toNamed(RouterHelper.getNotificationRoute());
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      return;
    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(".............onMessage............");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
      NotificationHelper.showNotification(
          message, flutterLocalNotificationsPlugin);
      if (Get.find<AuthController>().userLoggedIn()) {
        // Get.find<OrderController>().getRunningOrder(1);
        // Get.find<OrderController>().getHistoryOrder(1);
        // Get.find<NotificationController>().getNotificationList(true);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "onOpenApp: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
      try {
        if (message.notification?.titleLocKey != null) {
          //Get.toNamed(RouteHelper.getOrderDetailRoute(int.parse(message.notification!.titleLocKey!)));
        } else {
          //Get.toNamed(RouteHelper.getNotificationRoute());
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  static Future<void> showNotification(
    RemoteMessage msg,
    FlutterLocalNotificationsPlugin fln,
  ) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      msg.notification!.body!,
      htmlFormatBigText: true,
      contentTitle: msg.notification!.title!,
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id_1',
      'dbfood',
      importance: Importance.high,
      priority: Priority.high,
      styleInformation: bigTextStyleInformation,
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: IOSNotificationDetails());
    await fln.show(
      0,
      msg.notification!.title,
      msg.notification!.body,
      platformChannelSpecifics,
    );
  }
}
