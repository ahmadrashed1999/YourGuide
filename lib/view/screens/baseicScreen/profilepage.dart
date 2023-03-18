// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/pageprofilecontroller.dart';
import 'package:yourguide/main.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';

import '../../widgets/profile/customprofiletext.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  ProfilePageController c = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          const SizedBoxHieght(h: 20),
          Container(
            width: 70.0,
            height: 70.0,
            margin: const EdgeInsets.only(
              top: 24.0,
              bottom: 16.0,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_circle,
              size: 70.0,
              color: Colors.white,
            ),
            // child: Lottie.network(
            //     'https://assets10.lottiefiles.com/packages/lf20_fcecpvzp.json')
          ),
          Center(
              child: CustomProfileText(
                  size: 24, text: prefs.getString('fullName') ?? '')),
          Center(
              child: CustomProfileText(
                  size: 16, text: prefs.getString('university') ?? '')),
          Center(
              child: CustomProfileText(
                  size: 16, text: prefs.getString('specialty') ?? '')),
          const SizedBoxHieght(h: 20),
          const Divider(),
          const SizedBoxHieght(h: 20),
          const Center(
              child: CustomProfileText(
                  size: 14, text: 'هنا تجد الأيام التي يوجد بها مهام')),
          const SizedBoxHieght(h: 40),
          GetBuilder<ProfilePageController>(initState: (state) {
            c.fetchTasks();
          }, builder: (controller) {
            return Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TableCalendar(
                  headerVisible: false,
                  firstDay: DateTime.now().toUtc(),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      for (DateTime d in controller.toHighlight) {
                        if (day.day == d.day &&
                            day.month == d.month &&
                            day.year == d.year) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: AppColor.pinkClr,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
