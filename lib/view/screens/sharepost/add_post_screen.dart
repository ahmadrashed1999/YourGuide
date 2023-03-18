// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yourguide/component/constant/colors.dart';
// import 'package:yourguide/controller/addPostPageController/addPageController.dart';
// import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';
// import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
// import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
// import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
// import 'package:yourguide/view/widgets/Text/customtext.dart';

// import '../../widgets/AddPost/custom_form_feild.dart';

// class AddPost extends StatelessWidget {
//   AddPostPageControllerImpl c = Get.put(AddPostPageControllerImpl());
//   AddPost({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: GetBuilder<AddPostPageControllerImpl>(
//           builder: ((controller) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: const AppBarText(text: 'أضف منشور'),
//                 centerTitle: true,
//                 backgroundColor: AppColor.primary,
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const SizedBoxHieght(h: 20),
//                     CustomPostFieldPage(controller: controller.controller),
//                     const SizedBoxHieght(h: 10),
//                     GestureDetector(
//                       onTap: () async {
//                         await controller.addimage();
//                       },
//                       child: Card(
//                         color: AppColor.primary.withOpacity(0.2),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: controller.isUplodingImg
//                               ? SizedBox(
//                                   width: double.infinity,
//                                   child: Center(
//                                       child: Column(
//                                     children: const [
//                                       Icon(
//                                         Icons.done,
//                                         color: Colors.green,
//                                         size: 25,
//                                       ),
//                                       CustomText(
//                                         text: 'تم رفع الصورة',
//                                       )
//                                     ],
//                                   )),
//                                 )
//                               : Row(
//                                   children: const [
//                                     Icon(
//                                       Icons.image,
//                                       color: AppColor.primary,
//                                       size: 30,
//                                     ),
//                                     SizedBoxHieght(h: 20),
//                                     Text(
//                                       'اضف صورة مع المنشور',
//                                       style: TextStyle(
//                                           fontSize: 18.0, fontFamily: 'Cairo'),
//                                     ),
//                                   ],
//                                 ),
//                         ),
//                       ),
//                     ),
//                     const SizedBoxHieght(h: 40),
//                     controller.isLoading
//                         ? const CircularProgressIndicator(
//                             color: AppColor.primary,
//                           )
//                         : SizedBox(
//                             width: double.infinity,
//                             child: CustomButtonQuiz(
//                                 text: 'نشر',
//                                 onPressed: () async {
//                                   await controller.addposthere();

//                                   Get.to(const HomeScreen());
//                                 }))
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ));
//   }
// }
