import 'package:app/page/login_register/errorPage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'handler.dart';

class Routers {
  static String root = '/';
  static String mobileLoginPage = 'mobileLogin';
  static String mobileLoginNext = 'mobileLoginNext';

  static void configureRouters(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return ErrorPage("page not found");
        });
    router.define(root, handler: rootHandler);
    router.define(mobileLoginPage, handler: mobileLoginHandler);
    router.define(mobileLoginNext, handler: mobileLoginNextHandler);
  }

}