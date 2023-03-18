// ignore_for_file: file_names
// // ignore_for_file: unused_element

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:yourguide/main.dart';

// abstract class CommunityPagecontroller extends GetxController {}
// // 
// // class CommunityPagecontrollerImpl extends CommunityPagecontroller {
//   // late final RefreshController refreshController;
//   Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
//       .collection('posts')
//       .where('university', isEqualTo: prefs.getString('universitys'))
//       .where('specialty', isEqualTo: prefs.getString('specialty'))
//       .orderBy('time', descending: true)
//       .snapshots();
//   void onRefresh() async {
//     // monitor network fetch
//     await Future.delayed(const Duration(milliseconds: 10));
//     refreshController.refreshCompleted();
//     update();
//   }

//   void onLoading() async {
//     // monitor network fetch
//     await Future.delayed(const Duration(milliseconds: 1000));
//     refreshController.loadComplete();
//     update();
//   }

//   late bool isRegister;
//   void check() {
//     update();
//   }

//   // checkfelter() {
//   //   if (prefs.getBool('isuni') ?? true) {
//   //     usersStream = FirebaseFirestore.instance
//   //         .collection('posts')
//   //         .where('university', isEqualTo: prefs.getString('university'))
//   //         .orderBy('time', descending: true)
//   //         .snapshots();
//   //   } else if (prefs.getBool('iscollege') ?? true) {
//   //     usersStream = FirebaseFirestore.instance
//   //         .collection('posts')
//   //         .where('specialty', isEqualTo: prefs.getString('specialty'))
//   //         .orderBy('time', descending: true)
//   //         .snapshots();
//   //   } else {
//   //     usersStream = FirebaseFirestore.instance
//   //         .collection('posts')
//   //         .orderBy('time', descending: true)
//   //         .snapshots();
//   //   }
//   //   update();
//   // }

//   @override
//   void onInit() {
//     isRegister = prefs.getBool('isRegister') ?? false;
//     isRegister ? check() : null;

//     check();
//     refreshController = RefreshController();
//     super.onInit();
//   }
// }
