// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:yourguide/component/constant/colors.dart';
// import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
// import 'package:yourguide/view/widgets/Text/customtext.dart';

// class SubscribersPage extends StatelessWidget {
//   SubscribersPage({Key? key}) : super(key: key);
//   final Stream<QuerySnapshot> posts =
//       FirebaseFirestore.instance.collection('users').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CustomText(text: 'المشتركين'),
//         centerTitle: true,
//         backgroundColor: AppColor.primary,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: posts,
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return const Text('Something went wrong');
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Text("Loading");
//             }

//             return Directionality(
//               textDirection: TextDirection.rtl,
//               child: ListView(
//                 children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                   Map<String, dynamic> data =
//                       document.data()! as Map<String, dynamic>;
//                   return Container(
//                     width: double.infinity,
//                     height: 250,
//                     margin: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: AppColor.primary,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(text: data['full_name']),
//                               CustomText(text: data['university']),
//                               CustomText(text: data['specialty']),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(
//                                   // ignore: prefer_interpolation_to_compose_strings
//                                   text: 'عدد المنشورات : ' +
//                                       (data['posts_num'] ?? "0").toString()),
//                               CustomText(
//                                   // ignore: prefer_interpolation_to_compose_strings
//                                   text: 'عدد التعليقات : ' +
//                                       (data['comments_num'] ?? "0").toString()),
//                               CustomText(
//                                   // ignore: prefer_interpolation_to_compose_strings
//                                   text: 'عدد الإعجابات : ' +
//                                       (data['likes_num'] ?? "0").toString()),
//                             ],
//                           ),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SizedBox(
//                                 height: 40,
//                                 width: 100,
//                                 child: AnimatedButton(
//                                   color: Colors.blueGrey,
//                                   text: 'تعديل',
//                                   buttonTextStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: 'Cairo',
//                                   ),
//                                   pressEvent: () {},
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 40,
//                                 width: 100,
//                                 child: AnimatedButton(
//                                   color: Colors.redAccent,
//                                   text: 'حذف',
//                                   buttonTextStyle: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: 'Cairo',
//                                   ),
//                                   pressEvent: () {
//                                     // ignore: avoid_single_cascade_in_expression_statements
//                                     AwesomeDialog(
//                                       context: context,
//                                       dialogType: DialogType.WARNING,
//                                       animType: AnimType.BOTTOMSLIDE,
//                                       title: 'تحذير',
//                                       desc: 'هل انت متأكد من حذف هذا المستخدم',
//                                       btnCancelOnPress: () {},
//                                       btnOkOnPress: () async {
//                                         final collection = FirebaseFirestore
//                                             .instance
//                                             .collection('users');
//                                         collection
//                                             .doc(data[
//                                                 'id']) // <-- Doc ID to be deleted.
//                                             .delete() // <-- Delete
//                                             .then((_) => print('Deleted'))
//                                             .catchError((error) =>
//                                                 print('Delete failed: $error'));
//                                       },
//                                     )..show();
//                                   },
//                                 ),
//                               )
//                             ]),
//                         const SizedBoxHieght(h: 20)
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             );
//           }),
//     );
//   }
// }
