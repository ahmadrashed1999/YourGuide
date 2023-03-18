// ignore_for_file: prefer_const_constructors_in_immutables, annotate_overrides

import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourguide/component/constant/colors.dart';

import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';
import 'package:yourguide/view/screens/baseicScreen/infopage.dart';
import 'package:yourguide/view/screens/user/signup.dart';

Future backgroundMessage(RemoteMessage message) async {
  // print('==================');
  // print(message.notification!.title);
}

late SharedPreferences prefs;

var _firebaseMessaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  _firebaseMessaging.subscribeToTopic("all");
  FirebaseMessaging.onBackgroundMessage(backgroundMessage);
  MobileAds.instance.initialize();
  // prefs.setBool('isUser', true);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var fcm = FirebaseMessaging.instance;

  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();

    fcm.getToken().then((value) => {prefs.setString('token', value!)});
    fcm.subscribeToTopic('all');
    fcm.requestPermission();

    FirebaseMessaging.onMessage.listen((event) {
      // ignore: avoid_single_cascade_in_expression_statements
      AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.rightSlide,
        title: event.notification!.title,
        desc: event.notification!.body,
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
        btnCancelColor: Colors.redAccent[400],
        btnOkColor: AppColor.primary,
        btnCancelText: 'الغاء',
        btnOkText: 'موافق',
      )..show();
    });
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'دليلك الجامعي',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          duration: 1500,
          splashIconSize: 300,
          backgroundColor: AppColor.primary,
          splash: const Center(
            child: Text(
              'دليلك الجامعي',
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Cairo', color: Colors.white),
            ),
            // child: Lottie.network(
            //     'https://assets10.lottiefiles.com/packages/lf20_fcecpvzp.json'),
          ),
          nextScreen: prefs.getBool('isRegister') ?? false
              ? const HomeScreen()
              : LoginPage(),
        ));
  }
}
