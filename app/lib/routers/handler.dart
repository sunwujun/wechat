import 'package:app/page/login_register/login/mobile/mobileLogin.dart';
import 'package:app/page/login_register/login/mobile/mobileNext.dart';
import 'package:app/page/login_register/welcome.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WelcomePage();
});

Handler mobileLoginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MobileLoginPage();
});

Handler mobileLoginNextHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("下一步");
  final phone = params['phone'].first;
  return MobileLoginNext(phone);
});
