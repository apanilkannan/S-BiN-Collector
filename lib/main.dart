import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_bin_collector/src/common/prefernce_utils.dart';
import 'package:s_bin_collector/src/routes/app_pages.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> main() async {
  await NotificationController.initializeLocalNotifications();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Initialize SharedPrefs instance.
  await PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'S Bin',
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
