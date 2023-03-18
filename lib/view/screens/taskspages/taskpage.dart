// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/TaskController/taskpagecontroller.dart';
import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';

import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';

import '../../../data/model/taskmodel.dart';
import 'addtaskpage.dart';

class TaskHomePage extends StatelessWidget {
  TaskHomePage({Key? key}) : super(key: key);

  TaskControllerImp c = Get.put(TaskControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskControllerImp>(
        initState: (state) {
          c.fetchTasks();
        },
        builder: (controller) => Scaffold(
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: controller.tasks.isNotEmpty
                    ? Column(
                        children: [
                          const SizedBoxHieght(h: 30),
                          const CustomText(text: 'هذه هي مهامك'),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.tasks.length,
                              itemBuilder: (context, index) {
                                Task task = controller.tasks[index];
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    horizontalOffset: 300,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        onTap: () {
                                          task.done == 0
                                              ? Get.bottomSheet(
                                                  Container(
                                                    color: Colors.white,
                                                    height: 100,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        CustomButtonQuiz(
                                                            text:
                                                                'تم تنفيذ المهمة',
                                                            onPressed: () {
                                                              controller
                                                                  .completeTask(
                                                                      task.id);
                                                              cancelTheNotificaton(
                                                                  controller
                                                                      .tasks[
                                                                          index]
                                                                      .notificationid);
                                                              c.fetchTasks();
                                                              Get.back();
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : null;
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                controller.getBGCLr(task.color),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextCard(
                                                      text: task.title,
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .access_time_rounded,
                                                          color: Colors.grey,
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Column(
                                                          children: [
                                                            CustomTextCard(
                                                              text:
                                                                  '${controller.getArabicDay(task.day)} , ${task.hour}  ',
                                                            ),
                                                            CustomTextCard(
                                                                text: controller
                                                                    .dateFormat(
                                                                        task.time))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextCard(
                                                      text: task.description,
                                                    )
                                                  ],
                                                ),
                                              )),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColor.textColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(500)),
                                                    width: 50,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.delete_outlined,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () async {
                                                        await controller.sql.delete(
                                                            'tasks',
                                                            'id = ${controller.tasks[index].id}');
                                                        cancelTheNotificaton(
                                                            controller
                                                                .tasks[index]
                                                                .notificationid);
                                                        controller.tasks
                                                            .removeAt(index);
                                                        controller.update();
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBoxHieght(h: 10),
                                                  task.done == 0
                                                      ? const CustomTextCard(
                                                          text: 'غير مكتملة')
                                                      : const CustomTextCard(
                                                          text: 'مكتملة'),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.network(
                                'https://assets2.lottiefiles.com/packages/lf20_nroeicty.json'),
                            const CustomText(text: 'لا يوجد مهام مضافة بعد'),
                            const SizedBoxHieght(h: 15),
                          ],
                        ),
                      ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primary,
                onPressed: () {
                  Get.to(() => AddTaskPage());
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ));
  }
}
