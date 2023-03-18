// ignore_for_file: file_names
// // ignore_for_file: unused_element

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:yourguide/main.dart';

// abstract class PostController extends GetxController {}

// class PostControllerImp extends PostController {
//   TextEditingController commentC = TextEditingController();
//   CollectionReference posts = FirebaseFirestore.instance.collection('posts');

//   Future<bool?> increaseLikes(String postId, DocumentSnapshot doc) async {
//     // Get the document with the matching post ID
//     // DocumentSnapshot doc = await posts.doc(postId).get();
//     // print(doc);

//     // Increment the likes field by 1
//     int newLikes = doc["likes"] + 1;

//     // Update the document with the new number of likes
//     await posts.doc(postId).update({"likes": newLikes});
//     return true;
//   }

//   Future<bool?> increaseComment(String postId, DocumentSnapshot doc) async {
//     // Get the document with the matching post ID
//     // DocumentSnapshot doc = await posts.doc(postId).get();
//     // print(doc);

//     // Increment the likes field by 1
//     int newLikes = doc["likes"] + 1;

//     // Update the document with the new number of likes
//     await posts.doc(postId).update({"comments": newLikes});
//     return true;
//   }

//   Future<bool?> e(bool d) {
//     print(d);
//     return Future.value(true);
//   }

//   CollectionReference comment =
//       FirebaseFirestore.instance.collection('comments');
//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   Future<void> addComment(
//       id, post_id, DocumentSnapshot doc, DocumentSnapshot usersdoc) {
//     Random a = Random();
//     int rnd = a.nextInt(999999);
//     int newComment = doc["comments"] + 1;
//     int newcomments_num = usersdoc['comments_num'] + 1;
//     print(commentC.text);
//     return comment
//         .doc(id.toString() + rnd.toString())
//         .set({
//           'id': id.toString() + rnd.toString(),
//           'comment': commentC.text,
//           'post_id': post_id,
//           'time':
//               DateTime.now().millisecondsSinceEpoch, // 42, // 42, // 42, // 42,
//         })
//         .then((value) => {
//               print("User Added"),

//               // Update the document with the new number of likes
//               posts.doc(post_id).update({"comments": newComment}),
//               users.doc(id).update({"comments_num": newcomments_num}),
//               commentC.clear(),
//               Get.back(),
//               update(),
//             })
//         .catchError((error) => {
//               print("Failed to add user: $error"),
//             });
//   }

//   check(Map<String, dynamic> data, Map likes) {
//     try {
//       if (likes.isNotEmpty) {
//         likes[prefs.getString('id')! + data['post_id'].toString()]['id']
//                 .toString() ==
//             prefs.getString('id');

//         return true;
//       }
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<void> removeLike(id, post_id, Map likes, DocumentSnapshot doc,
//       DocumentSnapshot usersdoc) async {
//     Map newLikes = doc["likes"];
//     Map nekLikeMap = doc['likes'];
//     int newLikes_num = usersdoc['likes_num'] - 1;
//     int newLikes_num_doc = doc['likes_num'] - 1;
//     var pd = likes;
//     try {
//       if (likes.isNotEmpty) {
//         pd.remove(id + post_id);
//         posts
//             .doc(post_id)
//             .update({
//               'likes': pd

//               // 42, // 42, // 42,
//             })
//             .then((value) => {
//                   print("User Added"),
//                   posts.doc(post_id).update({"likes_num": newLikes_num_doc}),
//                   users.doc(id).update({"likes_num": newLikes_num - 1}),
//                   commentC.clear(),
//                   Get.back(),
//                   update(),
//                 })
//             .catchError((error) => {
//                   print("Failed to add user: $error"),
//                 });
//       }
//     } catch (e) {
//       print(e);
//     }
//     // return posts
//     //     .doc(post_id)
//     //     .update({
//     //       'likes': nekLikeMap

//     //       // 42, // 42, // 42,
//     //     })
//     //     .then((value) => {
//     //           print("User Added"),
//     //           posts.doc(post_id).update({"likes_num": newLikes.length}),
//     //           users.doc(id).update({"likes_num": newLikes_num}),
//     //           commentC.clear(),
//     //           Get.back(),
//     //           update(),
//     //         })
//     //     .catchError((error) => {
//     //           print("Failed to add user: $error"),
//     //         });]
//   }

//   Future<void> addLike(
//       id, post_id, DocumentSnapshot doc, DocumentSnapshot usersdoc) {
//     Map newLikes = doc["likes"] ?? {};
//     Map nekLikeMap = doc['likes'];
//     int newLikes_num = usersdoc['likes_num'] + 1;
//     int newLikes_num_doc = doc['likes_num'] + 1;
//     nekLikeMap[id + post_id] = {
//       'id': id.toString(),

//       'post_id': post_id,
//       'time': DateTime.now().millisecondsSinceEpoch, // 42, // 42, // 42, // 42,
//     };

//     return posts
//         .doc(post_id)
//         .update({
//           'likes': nekLikeMap

//           // 42, // 42, // 42,
//         })
//         .then((value) => {
//               print("User Added"),
//               posts.doc(post_id).update({"likes_num": newLikes_num_doc}),
//               users.doc(id).update({"likes_num": newLikes_num}),
//               commentC.clear(),
//               Get.back(),
//               update(),
//             })
//         .catchError((error) => {
//               print("Failed to add user: $error"),
//             });
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }
// }
