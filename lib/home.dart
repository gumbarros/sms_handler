import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sms_handler/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller)=> Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Center(
            child: Text(controller.message ?? "Aguardando SMS...", style: TextStyle(fontSize: 50),textAlign: TextAlign.center,)
          ),
        ),
      ),
    );
  }
}