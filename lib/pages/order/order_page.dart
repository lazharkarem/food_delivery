// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery/controllers/auth_controller.dart';
// import 'package:food_delivery/pages/order/view_order.dart';
// import 'package:food_delivery/utils/colors.dart';
// import 'package:food_delivery/utils/dimensions.dart';
// import 'package:get/get.dart';

// import '../../controllers/order_controller.dart';

// class OrderPage extends StatefulWidget {
//   OrderPage({Key? key}) : super(key: key);

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
//   late TabController _tabcontroller;
//   late bool _isLoggedIn;
//   @override
//   void initState() {
//     super.initState();
//     _isLoggedIn = Get.find<AuthController>().userLoggedIn();
//     if (_isLoggedIn) {
//       _tabcontroller = TabController(length: 2, vsync: this);
//       Get.find<OrderController>().getOrderList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Order"),
//         backgroundColor: AppColors.mainColor,
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: Dimensions.screenWidth,
//             child: TabBar(
//               indicatorColor: Theme.of(context).primaryColor,
//               indicatorWeight: 3,
//               labelColor: Theme.of(context).primaryColor,
//               unselectedLabelColor: Theme.of(context).disabledColor,
//               controller: _tabcontroller,
//               tabs: [
//                 Tab(
//                   text: "Current",
//                 ),
//                 Tab(
//                   text: "History",
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabcontroller,
//               children: const [
//                 ViewOrder(isCurrent: true),
//                 ViewOrder(isCurrent: false)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery/base/custome_app_bar.dart';
import 'package:food_delivery/controllers/order_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import 'view_order.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabcontroller = TabController(length: 2, vsync: this);
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabcontroller = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My orders"),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              controller: _tabcontroller,
              tabs: const [
                Tab(
                  text: "Current",
                ),
                Tab(text: "History")
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabcontroller,
              children: [
                ViewOrder(isCurrent: true),
                ViewOrder(isCurrent: false),
                // Text("1"),
                // Text("2")
              ],
            ),
          )
        ],
      ),
    );
  }
}
