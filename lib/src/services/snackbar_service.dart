import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SnackBarServices {
  snackBarSuccess({required String message, String? title}) {
    Get.snackbar(title ??'Aviso', message,
    duration: const Duration(seconds: 10),
    icon: Icon(
    Icons.message,
    color: Colors.green,),
        isDismissible: true,

        backgroundColor: Colors.green[100],
        mainButton: TextButton(
            onPressed: Get.back,
            child: const Text(
              "Close", style: TextStyle(color: Colors.black, fontSize: 12),
            ))
    );
  }

  snackBarError({required String message, String? title}) {
    Get.snackbar(
      title ?? "Error",
      message,
      duration: const Duration(seconds: 10),
      icon: Icon(
        Icons.error,
        color: Colors.red,
      ),
      isDismissible: true,

      backgroundColor: Colors.red[100],
      mainButton: TextButton(
          onPressed: Get.back,
          child: const Text(
              "Close", style: TextStyle(color: Colors.black, fontSize: 12),
          ))

    );
  }
}
