import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sms_handler/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
    theme: ThemeData(brightness: Brightness.dark),
  ));
}