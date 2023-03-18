// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/view/screens/Admin/subscriberspage.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';
import 'package:http/http.dart' as http;
import 'package:yourguide/view/widgets/notifications/notifacationwid.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

CollectionReference collectionStream =
    FirebaseFirestore.instance.collection('posts');
// Stream documentStream =
//     FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

class _AdminPageState extends State<AdminPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _data = posts;
  // }

  // void _deletePost(String key) {
  //   _database.reference().child("posts").child(key).remove();
  // }
  TextEditingController t_cont = TextEditingController();
  TextEditingController n_cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarText(text: "صفحة الأدمن"),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300,
                    height: 80,
                    child: CustomButtonQuiz(
                        text: 'ارسال إشعار',
                        onPressed: () async {
                          Get.bottomSheet(Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              height: 800,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBoxHieght(h: 20),
                                    const CustomText(
                                      text: 'ارسال إشعار',
                                    ),
                                    const SizedBoxHieght(h: 20),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: CustomNotiFieldHomePage(
                                          controller: t_cont,
                                          text: 'عنوان الملاحظة',
                                          hint: 'اكتب عنوان الملاحظة',
                                        )),
                                    const SizedBoxHieght(h: 20),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: CustomNotiFieldHomePage(
                                          controller: n_cont,
                                          text: 'نص الملاحظة',
                                          hint: 'اكتب نص الملاحظة',
                                        )),
                                    const SizedBoxHieght(h: 20),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: CustomButtonQuiz(
                                        text: 'ارسال',
                                        onPressed: () async {
                                          var body = json.encode({
                                            "notification": {
                                              "title": t_cont.text,
                                              "body": n_cont.text,
                                            },
                                            "to": "/topics/all",
                                          });
                                          var headers = {
                                            "Content-Type": "application/json",
                                            "Authorization":
                                                "Key=AAAAJvaCEDg:APA91bGRTCBvDVrveZnf3kbsGfBQGBYD_yg4LejA3BQfzutoujTWh6ZtrWD8E-6g3yjW1xkt5jBMgTx6TJdNx3QIScVAjhsdF2KE-X06cyS3qbjAFnlHqMFblA86uUgx3knpXl5CjFCA",
                                          };
                                          var response = await http.post(
                                            Uri.parse(
                                                'https://fcm.googleapis.com/fcm/send'),
                                            body: body,
                                            headers: headers,
                                          );
                                          print(response.body);
                                          t_cont.clear();
                                          n_cont.clear();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        })),
                const SizedBoxHieght(h: 20),
                // SizedBox(
                //     width: 300,
                //     height: 80,
                //     child: CustomButtonQuiz(
                //       text: 'المشتركين',
                //       onPressed: () {
                //         Get.to(() => SubscribersPage());
                //       },
                //     )),com.syncfast.yourguide (unreviewed)ca-app-pub-2902051447809378~3037912054
// ca-app-pub-2902051447809378~3037912054
              ],
            ),
          ),
        ));
  }
}

// Card(
//                     child: ListTile(
//                         title: Text(data['full_name']),
//                         subtitle: Text(data['post']),
//                         trailing: SizedBox(
//                           width: 100,
//                           height: 30,
//                           child: AnimatedButton(
//                             text: 'حذف',
//                             pressEvent: () {
//                               // ignore: avoid_single_cascade_in_expression_statements
//                               AwesomeDialog(
//                                 context: context,
//                                 dialogType: DialogType.WARNING,
//                                 animType: AnimType.BOTTOMSLIDE,
//                                 title: 'تحذير',
//                                 desc: 'هل انت متأكد من حذف هذا المنشور؟',
//                                 btnCancelOnPress: () {},
//                                 btnOkOnPress: () async {
//                                   final collection = FirebaseFirestore.instance
//                                       .collection('posts');
//                                   collection
//                                       .doc(data[
//                                           'post_id']) // <-- Doc ID to be deleted.
//                                       .delete() // <-- Delete
//                                       .then((_) => print('Deleted'))
//                                       .catchError((error) =>
//                                           print('Delete failed: $error'));
//                                 },
//                               )..show();
//                             },
//                           ),
//                         )),
//                   );
