// ignore_for_file: file_names
// // ignore: file_names
// // ignore_for_file: avoid_print

// import 'dart:io';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:yourguide/main.dart';

// abstract class AddPostPageController extends GetxController {}

// class AddPostPageControllerImpl extends AddPostPageController {
//   TextEditingController controller = TextEditingController();
//   CollectionReference posts = FirebaseFirestore.instance.collection('posts');
//   bool isLoading = false;
//   bool isUplodingImg = false;
//   var imagePicker = ImagePicker();
//   late File file;
//   late String userid;
//   String imgName = '';
//   String urlImge = '';
//   // ignore: prefer_typing_uninitialized_variables
//   var imgpicked;
//   addimage() async {
//     imgpicked = await imagePicker.pickImage(source: ImageSource.gallery);

//     if (imgpicked != null) {
//       file = File(imgpicked.path);
//       imgName = basename(imgpicked.path);
//       isUplodingImg = true;
//       Get.snackbar('تم اختيار الصورة', 'الرجاء الانتظار حتى يتم رفع الصورة',
//           snackPosition: SnackPosition.BOTTOM,
//           icon: const Icon(
//             Icons.check,
//             color: Colors.white,
//           ),
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//           duration: const Duration(seconds: 2));

//       update();
//     } else {
//       Get.snackbar('لم يتم إختيار أي صورة', 'الرجاء اختار صورة لتقوم بنشرها',
//           snackPosition: SnackPosition.BOTTOM,
//           icon: const Icon(
//             Icons.error,
//             color: Colors.white,
//           ),
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//           duration: const Duration(seconds: 3));
//     }
//   }

//   Random a = Random();

//   Future<void> addPost(fullName, id, university, specialty, imgLink, post) {
//     int rnd = a.nextInt(999999);

//     return posts
//         .doc(id.toString() + rnd.toString())
//         .set({
//           'full_name': fullName, // John Doe
//           'id': id, // 42
//           'university': university,
//           'specialty': specialty,
//           'post': post,
//           'img': imgLink,
//           'likes': {},
//           'likes_num': 0,
//           'comments': 0,
//           'post_id': id.toString() + rnd.toString(),
//           'time':
//               DateTime.now().millisecondsSinceEpoch, // 42, // 42, // 42, // 42,
//         })
//         .then((value) => {
//               print("User Added"),
//               increasPosts(id),
//             })
//         .catchError((error) => {
//               print("Failed to add user: $error"),
//             });
//   }

//   increasPosts(id) {
//     FirebaseFirestore.instance.collection('users').doc(id).update({
//       'posts_num': FieldValue.increment(1),
//     });
//   }

//   addposthere() async {
//     isLoading = true;
//     update();
//     if (imgName != '') {
//       imgName = basename(imgpicked.path);
//       var refsrtorg =
//           FirebaseStorage.instance.ref("/postesImages/$userid/$imgName");
//       await refsrtorg.putFile(file);
//       urlImge = await refsrtorg.getDownloadURL();
//     }
//     addPost(
//         prefs.getString('fullName') ?? '',
//         prefs.getString('id') ?? '',
//         prefs.getString('university') ?? '',
//         prefs.getString('specialty') ?? '',
//         urlImge,
//         controller.text);
//     isLoading = false;
//     update();
//     Get.back();

//     return true;
//   }

//   @override
//   void onInit() {
//     userid = prefs.getString('Id') ?? '';
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     controller.dispose();
//     super.onClose();
//   }
// }
