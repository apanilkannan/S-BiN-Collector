import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  void showErrorBar(String message,
      {bool isError = true, String title = "Errors"}) {
    Get.snackbar(title, message,
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent);
  }

  void showSuccessBar(String message,
      {bool isError = true, String title = "Success"}) {
    Get.snackbar(title, message,
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green);
  }
}
