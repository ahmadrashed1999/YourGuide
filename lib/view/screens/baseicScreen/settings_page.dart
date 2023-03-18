
// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yourguide/controller/basic/settingscontroller.dart';
// import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
// import 'package:yourguide/view/widgets/Text/customtext.dart';

// import '../../../component/constant/colors.dart';
// import '../../widgets/Appbar/appbartext.dart';

// class SettingsPage extends StatelessWidget {
//   SettingsPage({Key? key}) : super(key: key);

//   SettingsPagecontrollerImpl c = Get.put(SettingsPagecontrollerImpl());
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const AppBarText(
//               text: 'الاعدادات',
//             ),
//             elevation: 0,
//             centerTitle: true,
//             backgroundColor: AppColor.primary,
//           ),
//           body: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             width: double.infinity,
//             child: ListView(children: [
//               const SizedBoxHieght(h: 30),

//               // ignore: prefer_const_constructors
//               Card(
//                 child: const ListTile(
//                   title: CustomText(text: 'الصفحة الشخصية'),
//                   trailing: Icon(
//                     Icons.person,
//                     color: AppColor.primary,
//                   ),
//                 ),
//               ),
//               const SizedBoxHieght(
//                 h: 20,
//               ),
//               Card(
//                 child: ListTile(
//                   title: const CustomText(text: 'وضع ليلي'),
//                   trailing: Switch(
//                     value: true,
//                     onChanged: (value) {},
//                     activeColor: AppColor.primary,
//                     inactiveThumbColor: Colors.grey,
//                     inactiveTrackColor: Colors.grey,
//                   ),
//                 ),
//               ),
//               const SizedBoxHieght(
//                 h: 20,
//               ),
//               // GetBuilder<SettingsPagecontrollerImpl>(
//               //     builder: (controller) => Container(
//               //           padding: const EdgeInsets.symmetric(
//               //               horizontal: 20, vertical: 10),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(10),
//               //             color: Colors.grey[200],
//               //             border: Border.all(color: Colors.black, width: 2),
//               //           ),
//               //           child: Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 const CustomText(text: 'فلترة المنشورات'),
//               //                 Row(
//               //                   mainAxisAlignment:
//               //                       MainAxisAlignment.spaceAround,
//               //                   children: [
//               //                     const CustomText(
//               //                       text: 'عرض منشورات طلاب جامعتك فقط',
//               //                     ),
//               //                     const Spacer(),
//               //                     Switch(
//               //                       value: controller.isuni,
//               //                       onChanged: (value) {
//               //                         controller.isuni = value;
//               //                         prefs.setBool('isuni', value);
//               //                         controller.update();
//               //                       },
//               //                       activeColor: AppColor.primary,
//               //                       inactiveThumbColor: Colors.grey,
//               //                       inactiveTrackColor: Colors.grey,
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 Row(
//               //                   mainAxisAlignment:
//               //                       MainAxisAlignment.spaceAround,
//               //                   children: [
//               //                     const CustomText(
//               //                       text: 'عرض منشورات طلاب كليتك فقط',
//               //                     ),
//               //                     const Spacer(),
//               //                     Switch(
//               //                       value: controller.iscollege,
//               //                       onChanged: (value) {
//               //                         controller.iscollege = value;
//               //                         prefs.setBool('iscollege', value);
//               //                         controller.update();
//               //                       },
//               //                       activeColor: AppColor.primary,
//               //                       inactiveThumbColor: Colors.grey,
//               //                       inactiveTrackColor: Colors.grey,
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 const Text(
//               //                   'اذا اطفأت جميع الأزرار سيظهر لك جمع المنشورات',
//               //                   style: TextStyle(
//               //                     color: Colors.red,
//               //                     fontSize: 12,
//               //                     fontFamily: 'Cairo',
//               //                   ),
//               //                 )
//               //               ]),
//               //         )),
//               // const SizedBoxHieght(
//               //   h: 20,
//               // ),
//             ]),
//           ),
//         ));
//   }
// }
