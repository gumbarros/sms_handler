import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sms_handler/home.dart';

Future<void> main() async{
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
    theme: ThemeData(brightness: Brightness.dark, accentColor: Colors.white),
  ));
}