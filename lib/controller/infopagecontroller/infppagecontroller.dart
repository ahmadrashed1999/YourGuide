// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/data/uni/uninamespublic.dart';
import 'package:yourguide/main.dart';
import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';

abstract class InfoPageController extends GetxController {}

class InfoPageControllerImpl extends InfoPageController {
  final formKey = GlobalKey<FormState>();
  List publicUni = [
    {
      "name": "الجامعة الألمانية الأردنية",
      "website": "www.gju.edu.jo",
      "colleges": [
        "كلية الآداب واللغات التطبيقية (SAHL)",
        "كلية العلوم الطبية التطبيقية (SAMS)",
        "كلية العلوم التقنية التطبيقية (SATS)",
        "كلية الهندسة المعمارية وبيئة البناء (SABE)",
        "كلية العلوم والآداب الأساسية (SBSH)",
        "كلية الهندسة الكهربائية وتكنولوجيا المعلومات (SEEIT)",
        "كلية الهندسة وإدارة الموارد الطبيعية (SNREM)",
        "كلية الأعمال (BS)"
      ]
    },
    {
      "name": "جامعة الطفيلة التقنية",
      "website": "www.ttu.edu.jo",
      "colleges": [
        "كلية الهندسة",
        "كلية العلوم",
        "كلية تكنولوجيا المعلومات والاتصالات",
        "كلية الأعمال",
        "كلية الآداب",
        "كلية العلوم التربوية",
        "كلية التقنية المتوسطة",
      ]
    },
    {
      "name": "جامعة الحسين بن طلال",
      "website": "www.ahu.edu.jo",
      "colleges": [
        'كلية الآداب',
        'كلية القانون',
        'كلية العلوم التربوية',
        'كلية إدارة الأعمال',
        'كلية البترا للسياحة والآثار',
        'كلية تكنولوجيا المعلومات',
        'كلية الهندسة',
        'كلية العلوم',
        'كلية الأميرة عائشة بنت الحسين للتمريض والعلوم الصحية',
      ]
    },
    {
      "name": "جامعة البلقاء التطبيقية",
      "website": "www.bau.edu.jo",
      "colleges": [
        "كلية الدراسات العليا",
        "كلية الطب",
        "كلية الهندسة",
        "كلية التمريض",
        "كلية العلوم",
        "كلية الاعمال",
        "كلية السلط للعلوم الإنسانية",
        "كلية الامير عبدالله بن غازي للاتصالات وتكنولوجيا المعلومات",
        "كلية الزراعة التكنولوجية",
        "كلية السلط التقنية",
        "كلية الذكاء الاصطناعي",
        "كلية الحقوق"
      ]
    },
    {
      "name": "الجامعة الهاشمية",
      "website": "www.hu.edu.jo",
      "colleges": [
        "كلية العلوم التربوية",
        "كلية الملكة رانيا للطفولة",
        "كلية الامير حسن بن طلال للموارد الطبيعية والبيئية",
        "كلية الدراسات العليا",
        "كلية الاداب",
        "كلية التربية البدنية وعلوم الرياضة",
        "كلية الهندسة",
        "كلية الطب البشري",
        "كلية العلوم الصيدلانية",
        "كلية الاقتصاد والعلوم الادارية",
        "كلية الملكة رانيا للسياحة والتراث",
        "كلية العلوم",
        "كلية الامير الحسين بن عبدالله الثاني لتكنولوجيا المعلومات",
        "كلية العلوم الطبية التطبيقية",
        "كلية التمريض"
      ]
    },
    {
      "name": "جامعة آل البيت",
      "website": "www.aabu.edu.jo",
      "colleges": [
        "كلية الأمير الحسين بن عبدالله لتكنولوجيا المعلومات",
        "كلية الأعمال",
        "كلية الأميرة سلمى بنت عبدالله للتمريض",
        "كلية الشريعة",
        "كلية القانون",
        "كلية الاداب والعلوم الانسانية",
        "كلية الهندسة",
        "كلية العلوم",
        "كلية العلوم التربوية",
        "كلية علوم الطيران",
        "كلية بيت الحكمة للعلوم السياسية والدراسات الدولية",
        "كلية علوم الارض والبيئة",
        "كلية اللغات الاجنبية",
        "معهد الفلك وعلوم الفضاء",
        "المعهد العالي للدرسات الاسلامية"
      ]
    },
    {
      "name": "جامعة العلوم والتكنولوجيا الأردنية",
      "website": "www.just.edu.jo",
      "colleges": [
        "الهندسة",
        "الطب",
        "طب الأسنان",
        "الصيدلة",
        "التمريض",
        "الزراعة",
        "الطب البيطري",
        "العلوم والآداب",
        "تكنولوجيا الحاسوب والمعلومات",
        "العلوم الطبية التطبيقية",
        "العمارة والتصميم",
        "الدراسات العليا",
        "معهد النانوتكنولوجي"
      ]
    },
    {
      "name": "جامعة مؤتة(يوجد أيضا جناح عسكري)",
      "website": "www.mutah.edu.jo",
      "colleges": [
        'الطب',
        'الصيدلة',
        'التمريض',
        'الهندسة',
        'العلوم',
        'تكنولوجيا المعلومات',
        'الزراعة',
        'الآداب',
        'الأعمال',
        'الحقوق',
        'العلوم الاجتماعية',
        'الشريعة',
        'العلوم التربوية',
        'علوم الرياضة'
      ]
    },
    {
      "name": "جامعة اليرموك",
      "website": "www.yu.edu.jo",
      "colleges": [
        'لآداب',
        'العلوم',
        'الاعمال',
        'الحجاوي للهندسة التكنولوجية',
        'الشريعة والدراسات الاسلامية',
        'التربية',
        'التربية الرياضية',
        'القانون',
        'الفنون الجميلة',
        'تكنولوجيا المعلومات وعلوم الحاسوب',
        'الآثار والأنثروبولوجيا',
        'السياحة والفنادق',
        'الاعلام',
        'الصيدلة',
        'الطب',
        'التمريض',
      ]
    },
    {
      "name": "الجامعة الأردنية",
      "website": "www.ju.edu.jo",
      "colleges": [
        'كلية الآداب',
        'كلية الأعمال',
        'كلية الشريعة',
        'كلية العلوم التربوية',
        'كلية الحقوق',
        'كلية علوم الرياضة',
        'كلية الفنون والتصميم',
        'كلية الأمير الحسين بن عبدالله الثاني للدراسات الدولية',
        'كلية اللغات الأجنبية',
        'كلية الآثار والسياحة',
        'كلية الطب',
        'كلية التمريض',
        'كلية الصيدلة',
        'كلية طب الأسنان',
        'كلية علوم التأهيل',
        'كلية العلوم',
        'كلية الزراعة',
        'كلية الهندسة',
        'كلية الملك عبدالله الثاني لتكنولوجيا المعلومات',
      ]
    }
  ];

  List privateUni = [
    {
      "name": "جامعة عجلون الوطنية",
      "website": "www.anu.edu.jo",
      "colleges": [
        "كلية الآداب",
        "قسم اللغة العربية وآدابها",
        "قسم اللغة الانجليزية وآدابها",
        "قسم التاريخ",
        "قسم متطلبات الجامعة والعلوم الأساسية",
        "كلية الحقوق",
        "كلية تكنولوجيا المعلومات",
        "كلية الأعمال",
        "كلية الهندسة",
        "كلية العلوم",
        "كلية العلوم التربوية"
      ]
    },
    {
      "name": "الجامعة الأمريكية في مادبا",
      "website": "aum.edu.jo",
      "colleges": [
        "التعليم العام",
        "الهندسة",
        "العلوم",
        "العلوم الصحية",
        "تكنولوجيا المعلومات",
        "الأعمال والتمويل",
        "الهندسة المعمارية والتصميم",
        "اللغات والاتصال"
      ]
    },
    {
      "name": "جامعة جدارا",
      "website": "jadara.edu.jo",
      "colleges": [
        "كلية الصيدلة",
        "كلية الهندسة",
        "كلية العلوم وتكنولوجيا المعلومات",
        "كلية الأعمال",
        "كلية الآداب واللغات",
        "كلية العلوم التربوية",
        "كلية القانون",
        "كلية الدراسات العليا"
      ]
    },
    {
      "name": "جامعة الشرق الأوسط",
      "website": "meu.edu.jo",
      "colleges": [
        "كلية الآداب والعلوم التربوية",
        "كلية الحقوق",
        "كلية الأعمال",
        "كلية تكنولوجيا المعلومات",
        "كلية العلوم الطبية المساندة",
        "كلية الهندسة",
        "كلية الاعلام",
        "كلية العمارة والتصميم",
        "كلية الصيدلة"
      ]
    },
    {
      "name": "جامعة عمان العربية",
      "website": "www.aau.edu.jo",
      "colleges": [
        "كلية العلوم التربوية والنفسية",
        "كلية الآداب والعلوم",
        "كلية الهندسة",
        "كلية الصيدلة",
        "كلية علوم الطيران",
        "كلية الأعمال",
        "كلية العلوم الحاسوبية والمعلوماتية",
        "كلية الشريعة"
      ]
    },
    {
      "name": "جامعة الزرقاء",
      "website": "www.zu.edu.jo",
      "colleges": [
        "كلية الشريعة",
        "كلية الآداب",
        "كلية الاقتصاد والعلوم الإدارية",
        "كلية العلوم التربوية",
        "كلية الحقوق",
        "كلية الفنون والتصميم",
        "كلية الإعلام",
        "كلية طب الأسنان",
        "كلية الصيدلة",
        "كلية التمريض",
        "كلية العلوم الطبية المساندة",
        "كلية العلوم",
        "كلية تكنولوجيا المعلومات",
        "كلية الهندسة التكنولوجية"
      ]
    },
    {
      "name": "جامعة الزيتونة الأردنية",
      "website": "www.zuj.edu.jo",
      "colleges": [
        "كلية العلوم وتكنولوجيا المعلومات",
        "كلية الصيدلة",
        "كلية التمريض",
        "كلية الآداب",
        "كلية الأعمال",
        "كلية الحقوق",
        "كلية الهندسة والتكنولوجيا",
        "كلية العمارة والتصميم"
      ]
    },
    {
      "name": "جامعة جرش",
      "website": "www.jpu.edu.jo",
      "colleges": [
        "كلية الآداب",
        "كلية الأعمال",
        "كلية العلوم",
        "كلية الشريعة",
        "كلية الحقوق",
        "كلية الزراعة",
        "كلية الصيدلة",
        "كلية العلوم التربويّة",
        "كلية التمريض",
        "العلوم الطبية التطبيقية",
        "كلية الهندسة",
        "كلية تكنولوجيا المعلومات"
      ]
    },
    {
      "name": "جامعة الإسراء",
      "website": "www.iu.edu.jo",
      "colleges": [
        'كلية الآداب',
        'كلية الأعمال',
        'كلية الحقوق',
        'كلية الهندسة',
        'كلية الصيدلة',
        'كلية تكنولوجيا المعلومات',
        'كلية العلوم التربوية',
        'كلية التمريض',
        'كلية العلوم',
        'كلية العلوم الطبية المساندة'
      ]
    },
    {
      "name": "جامعة البترا",
      "website": "www.uop.edu.jo",
      "colleges": [
        'كلية تكنولوجيا المعلومات',
        'كلية العلوم الإدارية والمالية',
        'كلية الآداب والعلوم',
        'كلية الحقوق',
        'كلية الصيدلة والعلوم الطبية',
        'كلية الإعلام',
        'كلية الهندسة',
      ]
    },
    {
      "name": "جامعة العلوم التطبيقية الخاصة",
      "website": "www.asu.edu.jo",
      "colleges": [
        'كلية الآداب والعلوم',
        'كلية الهندسة والتكنولوجيا',
        'كلية الصيدلة',
        'كلية الأعمال',
        'كلية تكنولوجيا المعلومات',
        'كلية الحقوق',
        'كلية الفنون والتصميم',
        'كلية التمريض',
        'كلية الشريعة والدراسات الإسلامية'
      ]
    },
    {
      "name": "جامعة فيلادلفيا",
      "website": "philadelphia.edu.jo",
      "colleges": [
        'كلية الأعمال',
        'كلية الآداب والفنون',
        'كلية الهندسة والتكنولوجيا',
        'كلية الصيدلة',
        'كلية التمريض',
        'كلية العلوم',
        'كلية الحقوق',
      ]
    },
    {
      "name": "جامعة عمان الأهلية",
      "website": "www.ammanu.edu.jo",
      "colleges": [
        'كلية تقنية المعلومات',
        'كلية العمارة والتصميم',
        'كلية التمريض',
        'كلية الصيدلة',
        'كلية العلوم الطبية المساندة',
        'كلية الآداب والعلوم',
        'كلية الهندسة',
        'كلية الحقوق',
        'كلية الأعمال',
        'كلية التكنولوجيا الزراعية',
        'كلية العلوم التربوية'
      ]
    }
  ];

  TextEditingController controller = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late var userCredential;
  List<String> university = [];
  List<String> private_university = [];
  List<String> specialty = ['اختر التخصص...'];

  List<String> unitype = ['حكومية', 'خاصة'];

  late String uni_type_name;
  late String uniname;
  late String private_uniname;
  late String specialty_name;
  bool isloading = false;
  late bool isRegister;

  bool isPrivate = false;
  void Function(String?)? onchangeDropDown(x) {
    uni_type_name = x;
    if (x == 'حكومية') {
      isPrivate = false;
    } else {
      isPrivate = true;
    }
    update();
    return null;
  }

  void Function(String?)? onchangeDropDown2(x) {
    uniname = x;
    initializedTheSpe();
    update();
    return null;
  }

  void Function(String?)? onchangeDropDown3(x) {
    private_uniname = x;
    initializedTheSpe();
    update();
    return null;
  }

  void Function(String?)? onchangeDropDown4(x) {
    specialty_name = x;
    update();
    return null;
  }

  void register() async {
    isloading = true;
    update();
    isPrivate ? uniname = private_uniname : uniname = uniname;
    prefs.setBool('isRegister', true);
    prefs.setString('fullName', controller.text);
    prefs.setString('university', uniname);
    prefs.setString('specialty', specialty_name);
    isloading = false;
    update();
  }

  Future<void> addUser(fullName, id, university, specialty) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(id)
        .set({
          'full_name': fullName, // John Doe
          'id': id, // 42
          'university': university,
          'specialty': specialty,
          'posts_num': 0,
          'comments_num': 0,
          'likes_num': 0,
        })
        .then((value) => {
              prefs.setBool('isRegister', true),
              prefs.setString('fullName', fullName),
              prefs.setString('id', id),
              prefs.setString('university', university),
              prefs.setString('specialty', specialty),
              Get.snackbar(
                'تم التسجيل بنجاح',
                'تم التسجيل بنجاح',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              ),
              Get.off(const HomeScreen()),
            })
        .catchError((error) => {
              Get.snackbar(
                'حدث خطأ',
                'حدث خطأ',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              ),
              prefs.setBool('isRegister', false)
            });
  }

  initializedUni() {
    publicUni.forEach((element) {
      university.add(element['name']);
    });
    privateUni.forEach((element) {
      private_university.add(element['name']);
    });
  }

  initializedTheSpe() {
    specialty.clear();
    specialty = ['اختر التخصص...'];
    if (isPrivate) {
      privateUni.forEach((element) {
        if (private_uniname == element['name']) {
          element['colleges'].forEach((element) {
            specialty.add(element);
          });
        } else {}
      });
    } else {
      publicUni.forEach((element) {
        if (uniname == element['name']) {
          element['colleges'].forEach((element) {
            specialty.add(element);
          });
        } else {}
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    controller.text = prefs.getString('fullName') ?? '';
    initializedUni();
    uni_type_name = unitype[0];
    uniname = university[0];
    private_uniname = private_university[0];
    specialty_name = specialty[0];
    isRegister = prefs.getBool('isRegister') ?? false;
  }
}
