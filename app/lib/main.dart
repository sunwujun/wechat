
import 'dart:io';

import 'package:app/page/login_register/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  if (Platform.isAndroid) {
    runApp(MyApp());
    var style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
    );
  }
}
