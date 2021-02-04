import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sms/sms.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{

  final SmsReceiver receiver = SmsReceiver();
  final GetStorage gs = GetStorage();

  String phone;
  String message;

  @override
  void onInit() {

    receiver.onSmsReceived.listen((SmsMessage smsMessage) async{
        ///Pega apenas o número da String
        this.message = smsMessage.body.replaceAll(new RegExp(r'[^0-9]'),'');

        this.phone = gs.read('phone');

        await sendToAPI();

        update();
    });

    super.onInit();
  }

  Future<void> sendToAPI() async{
    const String url = "http://sms-handler-com.umbler.net/sms";


    final http.Response response = await http.post(url, body:jsonEncode({"content":this.message, "phone": this.phone, "date": DateTime.now().toString()}),encoding: Encoding.getByName("utf-8"), headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
    });

    message += "\n\nResposta do Servidor:\n\n${response.body}";
  }

  void phoneDialog(){
    Get.defaultDialog(
      title: "Número do Celular",
      content: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        onChanged: (value){
          phone = value;
        },
      ),
      onCancel: (){},
        textCancel: "Cancelar",
        textConfirm: "Salvar",
      onConfirm: (){
        gs.write("phone", phone);
        Get.back();
      }
    );
  }

}