import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:s_bin_collector/src/common/prefernce_utils.dart';
import 'package:s_bin_collector/src/routes/app_routes.dart';
import 'package:s_bin_collector/src/service/notification.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {




    getFcmToken();
    readToken();
    super.onInit();
  }


  getFcmToken() async {
    await firebaseMessaging.getToken().then((value) {
      debugPrint("FCM Token: $value");
      PreferenceUtils.setString('token', '$value');
    });
  }

  readToken() async {
    var token = await PreferenceUtils.getString('token');
    var loginStatus = PreferenceUtils.getBool('isLogin');
    if (token != null && token.isNotEmpty && loginStatus == true) {
      Get.toNamed(AppRoutes.googleMap);
    }
    debugPrint('token : $token');
  }
}
