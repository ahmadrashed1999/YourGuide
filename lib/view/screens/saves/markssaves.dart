// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/controller/basic/marksavescontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';

import '../../../component/constant/colors.dart';

class MraksSaves extends StatelessWidget {
  const MraksSaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MarkSavesPageControllerImpl controller =
        Get.put(MarkSavesPageControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title:const AppBarText(text: 'العلامات المحفوظة'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<MarkSavesPageControllerImpl>(
                builder: (controller) => ListView.builder(
                    itemCount: controller.marks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text(controller.marks[i]['name']),
                          subtitle: Text(controller.marks[i]['mark']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    var res = await controller.sql.deleteData(
                                        'delete from marks where id = ${controller.marks[i]['id']}');
                                    if (res > 0) {
                                      controller.marks.removeWhere((element) =>
                                          element['id'] ==
                                          controller.marks[i]['id']);
                                      controller.updateUi();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            controller.isAdLoaded
                ? SizedBox(
                    height: controller.bannerAd.size.height.toDouble(),
                    width: controller.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: controller.bannerAd),
                  )
                : const SizedBox(),
          ],
        ));
  }
}
