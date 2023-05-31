import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:s_bin_collector/src/common/app_tags.dart';
import 'package:s_bin_collector/src/common/prefernce_utils.dart';
import 'package:s_bin_collector/src/common/widgets/app_background.dart';
import 'package:s_bin_collector/src/common/widgets/app_colors.dart';
import 'package:s_bin_collector/src/common/widgets/common_app_bar.dart';
import 'package:s_bin_collector/src/common/widgets/round_button.dart';
import 'package:s_bin_collector/src/modules/marker_detail/controllers/marker_detail_controller.dart';
import 'package:s_bin_collector/src/routes/app_routes.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MarkerDetailScreen extends GetView<MarkerDetailController> {


  MarkerDetailScreen({super.key});

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getBinStatus(arguments['marker']);
    debugPrint("arguments : $arguments");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CommonAppBar(
            title: '${arguments['device']}',
            leadingWidget: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          )),
      body: AppBackground(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 10,
              child: SizedBox(
                width: 100,
                child: RoundButton(
                  onClick: () {
                    PreferenceUtils.clearData();
                    Get.offAllNamed(AppRoutes.login);
                  },
                  text: "Log out",
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(

                children: [
                  Image.asset(
                    'assets/images/throwing_trash.png',
                    height: 200,
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,bottom: 50),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Location : ${arguments['location']}",
                          style: AppTags.font20weight500black,
                        )),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.verdantGrn),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(controller.gas.value,
                                    style: AppTags.font16weight500)),
                            const Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Gas Level",
                                  style: AppTags.font16weight500,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.verdantGrn),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(controller.temp.toString(),
                                    style: AppTags.font16weight500)),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Temperature",
                                  style: AppTags.font16weight500.copyWith(fontSize: 14),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),),

                  const SizedBox(height: 10,),
                  Obx(() =>  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.verdantGrn),
                        child: Stack(

                          children: [
                            Align(
                                alignment: Alignment.center,
                                child:Text(controller.binStatus.value,
                                    style: AppTags.font16weight500)),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Plastic Waste",
                                  style: AppTags.font16weight500.copyWith(fontSize: 14),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.verdantGrn),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(controller.foodWaste.value,
                                    style: AppTags.font16weight500)),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Food Waste",
                                  style: AppTags.font16weight500.copyWith(fontSize: 14),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),),



                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: RoundButton(
                  onClick: () {
                    MapsLauncher.launchCoordinates(
                        arguments['Latitude'], arguments['Longitude']);
                  },
                  text: 'Navigate'),
            )
          ],
        ),
      ),
    );
  }
}
