import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sms/sms.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{

  final SmsReceiver receiver = SmsReceiver();

  String message;

  @override
  void onInit() {
    receiver.onSmsReceived.listen((SmsMessage message) async{
        ///Pega apenas o número da String
        this.message = message.body.replaceAll(new RegExp(r'[^0-9]'),'');

        await sendToAPI();

        update();
    });

    super.onInit();
  }

  Future<void> sendToAPI() async{
    const String url = "https://sms-handler-api.herokuapp.com/sms";


    final http.Response response = await http.post(url, body:jsonEncode({"sms":message}),encoding: Encoding.getByName("utf-8"), headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
    });

    message += "\n\nResposta do Servidor:\n${response.body}";
  }

}