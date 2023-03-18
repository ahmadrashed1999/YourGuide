// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:get/get.dart';
// import 'package:like_button/like_button.dart';
// import 'package:lottie/lottie.dart';

// import 'package:yourguide/controller/addPostPageController/postControler.dart';
// import 'package:yourguide/controller/infopagecontroller/communityPagecontroller.dart';
// import 'package:yourguide/data/model/postmodel.dart';
// import 'package:yourguide/main.dart';
// import 'package:yourguide/view/screens/baseicScreen/infopage.dart';
// import 'package:yourguide/view/screens/sharepost/add_post_screen.dart';
// import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
// import 'package:yourguide/view/widgets/Text/customtext.dart';

// import '../../../component/constant/colors.dart';

// class CommunityPage extends StatefulWidget {
//   const CommunityPage({Key? key}) : super(key: key);

//   @override
//   State<CommunityPage> createState() => _CommunityPageState();
// }

// class _CommunityPageState extends State<CommunityPage> {
//   CollectionReference posts = FirebaseFirestore.instance.collection('posts');
//   CommunityPagecontrollerImpl controller =
//       Get.put(CommunityPagecontrollerImpl());
//   PostControllerImp postcontroller = Get.put(PostControllerImp());

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: GetBuilder<CommunityPagecontrollerImpl>(
//         builder: (controller) => Scaffold(
//             backgroundColor: AppColor.primary.withOpacity(0.1),
//             body: prefs.getBool('isRegister') == true
//                 ? StreamBuilder<QuerySnapshot>(
//                     stream: controller.usersStream,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (snapshot.hasError) {
//                         return Text('Something went wrong');
//                       }

//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(
//                               color: AppColor.primary),
//                         );
//                       }

//                       if (snapshot.data!.size > 0) {
//                         return RefreshIndicator(
//                           color: AppColor.primary,
//                           onRefresh: () {
//                             return Future.delayed(
//                                 const Duration(seconds: 1), () {});
//                           },
//                           child: ListView(
//                             children: snapshot.data!.docs
//                                 .map((DocumentSnapshot document) {
//                               Map<String, dynamic> data =
//                                   document.data() as Map<String, dynamic>;

//                               return GetBuilder<PostControllerImp>(
//                                   builder: (Postcontroller) {
//                                 return AnimationConfiguration.staggeredList(
//                                   position: 1,
//                                   child: SlideAnimation(
//                                     horizontalOffset: 300,
//                                     child: FadeInAnimation(
//                                       child: SizedBox(
//                                         child: Container(
//                                           margin: const EdgeInsets.symmetric(
//                                               vertical: 20, horizontal: 5),
//                                           constraints: const BoxConstraints(
//                                               minHeight: 100),
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 20, horizontal: 10),
//                                           width: double.infinity,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                           ),
//                                           child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     const HeaderPostWidget(),
//                                                     IconButton(
//                                                         onPressed: () {},
//                                                         icon: const Icon(
//                                                             Icons.info))
//                                                   ],
//                                                 ),
//                                                 CustomText(text: data['post']),
//                                                 const SizedBox(
//                                                   height: 30,
//                                                 ),
//                                                 data['img'] == ''
//                                                     ? Container()
//                                                     : ClipRRect(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8.0),
//                                                         child: Image.network(
//                                                           data['img'],
//                                                           width:
//                                                               double.infinity,
//                                                         )),
//                                                 const SizedBox(
//                                                   height: 30,
//                                                 ),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     GestureDetector(
//                                                       onTap: () async {
//                                                         DocumentSnapshot doc =
//                                                             await posts
//                                                                 .doc(data[
//                                                                     'post_id'])
//                                                                 .get();
//                                                         DocumentSnapshot
//                                                             userdoc =
//                                                             await postcontroller
//                                                                 .users
//                                                                 .doc(data['id'])
//                                                                 .get();
//                                                         postcontroller.check(
//                                                                 data,
//                                                                 data['likes'] ??
//                                                                     {})
//                                                             ? postcontroller.removeLike(
//                                                                 prefs.getString(
//                                                                     'id'),
//                                                                 data['post_id'],
//                                                                 data['likes'],
//                                                                 doc,
//                                                                 userdoc)
//                                                             : Postcontroller.addLike(
//                                                                 prefs.getString(
//                                                                     'id'),
//                                                                 data['post_id'],
//                                                                 doc,
//                                                                 userdoc);
//                                                       },
//                                                       child: Container(
//                                                         height: 45,
//                                                         width: 120,
//                                                         decoration: BoxDecoration(
//                                                             border: Border.all(
//                                                                 color: Colors
//                                                                     .grey),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5)),
//                                                         child: Center(
//                                                           child: Container(
//                                                             width: 120,
//                                                             height: 45,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5)),
//                                                             child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .spaceEvenly,
//                                                               children: [
//                                                                 Icon(
//                                                                     Icons
//                                                                         .favorite,
//                                                                     color: Postcontroller.check(
//                                                                             data,
//                                                                             data['likes'] ??
//                                                                                 {})
//                                                                         ? Colors
//                                                                             .red
//                                                                         : Colors
//                                                                             .grey),
//                                                                 CustomText(
//                                                                     text:
//                                                                         '${data['likes_num']} إعجاب')
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       width: 120,
//                                                       height: 45,
//                                                       decoration: BoxDecoration(
//                                                           border: Border.all(
//                                                               color:
//                                                                   Colors.grey),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(5)),
//                                                       child: Center(
//                                                         child: GestureDetector(
//                                                             onTap: () {
//                                                               Get.bottomSheet(
//                                                                 Directionality(
//                                                                   textDirection:
//                                                                       TextDirection
//                                                                           .rtl,
//                                                                   child:
//                                                                       Container(
//                                                                     height: double
//                                                                         .infinity,
//                                                                     color: Colors
//                                                                         .white,
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         const SizedBox(
//                                                                           height:
//                                                                               10,
//                                                                         ),
//                                                                         const CustomText(
//                                                                           text:
//                                                                               'تعليق',
//                                                                         ),
//                                                                         FutureBuilder(
//                                                                           future: FirebaseFirestore
//                                                                               .instance
//                                                                               .collection('comments')
//                                                                               .where('post_id', isEqualTo: data['post_id'])
//                                                                               .get(),
//                                                                           builder:
//                                                                               (BuildContext context, AsyncSnapshot snapshot) {
//                                                                             if (snapshot.hasData) {
//                                                                               List<DocumentSnapshot> comments = snapshot.data!.docs;
//                                                                               return Expanded(
//                                                                                 child: ListView.builder(
//                                                                                   itemCount: comments.length,
//                                                                                   itemBuilder: (BuildContext context, int index) {
//                                                                                     return Card(
//                                                                                       child: ListTile(
//                                                                                         title: Row(
//                                                                                           children: const [
//                                                                                             Icon(
//                                                                                               Icons.account_circle,
//                                                                                               size: 20.0,
//                                                                                               color: Colors.grey,
//                                                                                             ),
//                                                                                             SizedBox(
//                                                                                               width: 10,
//                                                                                             ),
//                                                                                             Text(
//                                                                                               'مجهول',
//                                                                                               style: TextStyle(fontSize: 12, fontFamily: 'Cairo'),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                         subtitle: Text(
//                                                                                           comments[index]['comment'].toString(),
//                                                                                           style: const TextStyle(fontSize: 12, fontFamily: 'Cairo'),
//                                                                                         ),
//                                                                                       ),
//                                                                                     );
//                                                                                   },
//                                                                                 ),
//                                                                               );
//                                                                             } else {
//                                                                               return const CircularProgressIndicator(
//                                                                                 color: AppColor.primary,
//                                                                               );
//                                                                             }
//                                                                           },
//                                                                         ),
//                                                                         const SizedBox(
//                                                                           height:
//                                                                               10,
//                                                                         ),
//                                                                         Container(
//                                                                           padding:
//                                                                               const EdgeInsets.symmetric(horizontal: 10),
//                                                                           height:
//                                                                               60,
//                                                                           child:
//                                                                               Row(
//                                                                             children: [
//                                                                               Expanded(
//                                                                                 child: TextFormField(
//                                                                                   controller: Postcontroller.commentC,
//                                                                                   decoration: const InputDecoration(
//                                                                                     hintText: 'اكتب تعليقك هنا',
//                                                                                     border: OutlineInputBorder(
//                                                                                       borderRadius: BorderRadius.all(
//                                                                                         Radius.circular(10.0),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 height: 50,
//                                                                                 width: 50,
//                                                                                 child: IconButton(
//                                                                                   icon: const Icon(
//                                                                                     Icons.send,
//                                                                                     size: 30.0,
//                                                                                     color: Colors.blue,
//                                                                                   ),
//                                                                                   onPressed: () async {
//                                                                                     DocumentSnapshot userdoc = await postcontroller.users.doc(data['id']).get();
//                                                                                     DocumentSnapshot doc = await posts.doc(data['post_id']).get();
//                                                                                     Postcontroller.addComment(prefs.getString('id'), data['post_id'], doc, userdoc);
//                                                                                   },
//                                                                                 ),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               );
//                                                             },
//                                                             child: Row(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .center,
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 const Icon(
//                                                                   Icons
//                                                                       .comment_rounded,
//                                                                   size: 15,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           8.0),
//                                                                   child: CustomText(
//                                                                       text:
//                                                                           '${data['comments']} تعليق'),
//                                                                 ),
//                                                               ],
//                                                             )),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ]),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               });
//                             }).toList(),
//                           ),
//                         );
//                       } else {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Lottie.network(
//                                   'https://assets2.lottiefiles.com/packages/lf20_nroeicty.json'),
//                               const CustomText(text: 'لا يوجد منشورات بعد')
//                             ],
//                           ),
//                         );
//                       }
//                     })
//                 : SizedBox(
//                     width: double.infinity,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const CustomText(
//                             text:
//                                 'لم تقم بالتسجيل بعد قم بالتسجيل لتبدأ التواصل '),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         CustomButtonQuiz(
//                             text: "قم بالتسجيل",
//                             onPressed: () {
//                               Get.to(() => LoginPage());
//                             }),
//                       ],
//                     ),
//                   ),
//             floatingActionButton: prefs.getBool('isRegister') == true
//                 ? FloatingActionButton(
//                     backgroundColor: AppColor.primary,
//                     onPressed: () {
//                       Get.to(() => AddPost());
//                     },
//                     child: const Icon(
//                       Icons.add,
//                     ),
//                   )
//                 : null),
//       ),
//     );
//   }
// }

// class HeaderPostWidget extends StatelessWidget {
//   const HeaderPostWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: const [
//         Icon(
//           Icons.account_circle,
//           size: 30.0,
//           color: Colors.grey,
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Text(
//           'مجهول',
//           style: TextStyle(fontSize: 16, fontFamily: 'Cairo'),
//         ),
//       ],
//     );
//   }
// }
