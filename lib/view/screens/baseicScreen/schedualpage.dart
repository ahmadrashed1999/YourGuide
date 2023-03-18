
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:yourguide/component/constant/colors.dart';

import 'package:yourguide/controller/basic/schedualpagecontroller.dart';
import 'package:yourguide/view/screens/taskspages/add_datepage.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';

// ignore: must_be_immutable
class SchedualPage extends StatelessWidget {
  SchedualPage({Key? key}) : super(key: key);

  SchedualPageControllerImp c = Get.put(SchedualPageControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedualPageControllerImp>(
      initState: (state) {
        c.getTask();
      },
      builder: (controller) => Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: controller.check()
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBoxHieght(h: 30),
                      const CustomText(text: 'هذه هي مواد هذا الفصل ومواعيدها'),
                      const SizedBoxHieght(h: 30),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.taskList.length,
                          itemBuilder: (context, index) {
                            var task = controller.taskList[index];

                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                horizontalOffset: 300,
                                child: FadeInAnimation(
                                  child: Card(
                                      color: controller.getBGCLr(task.color),
                                      elevation: 5,
                                      shadowColor: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  RowCard(
                                                    cardTitle: 'إسم المقرر : ',
                                                    cardValue: controller
                                                        .taskList[index].name,
                                                  ),
                                                  RowCard(
                                                    cardTitle: 'التوقيت : ',
                                                    cardValue:
                                                        'من : ${controller.taskList[index].timeFrom}\nإلى : ${controller.taskList[index].timeTo}',
                                                  ),
                                                  RowCard(
                                                    cardTitle: 'الأيام : ',
                                                    cardValue: controller
                                                        .taskList[index].days,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: AppColor.textColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          500)),
                                              width: 50,
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.delete_outlined,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () async {
                                                  controller.db.delete('timing',
                                                      'id = ${controller.taskList[index].id}');
                                                  controller.taskList
                                                      .removeAt(index);

                                                  controller.update();
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                          'https://assets2.lottiefiles.com/packages/lf20_nroeicty.json'),
                      const CustomText(text: 'لا يوجد مواد مضافة بعد'),
                    ],
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {
            Get.to(() => AddCourseTime());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  const RowCard({
    Key? key,
    required this.cardTitle,
    required this.cardValue,
  }) : super(key: key);
  final String cardTitle;
  final String cardValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 100, child: CustomTextCard(text: cardTitle)),
        SizedBox(width: 150, child: CustomTextCard(text: cardValue)),
      ],
    );
  }
}
