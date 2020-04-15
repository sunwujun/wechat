import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorInfo;
  ErrorPage(this.errorInfo);

  @override
  Widget build(BuildContext context) {
    return Text(errorInfo);
  }
}