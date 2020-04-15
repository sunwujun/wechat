import 'package:app/common/style/colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/others/bg_welcome.jpg"),
            fit: BoxFit.cover,
          )),
      child: Container(
          margin: EdgeInsets.only(bottom: 25),
          alignment: FractionalOffset.bottomCenter,
//          color: Colors.red.withOpacity(.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 45,
                width: 130,
                child: FlatButton(
                  color: AppColors.lightColorTheme,
                  highlightColor: AppColors.darkColorTheme,
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("登录",
                      style: new TextStyle(
                          color: AppColors.colorWhite, fontSize: 20.0)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                  },
                ),
              ),
              Container(
                height: 45,
                width: 130,
                child: FlatButton(
                  color: AppColors.colorWhite,
                  highlightColor: AppColors.colorBlack,
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("注册",
                      style: new TextStyle(
                          color: AppColors.lightColorTheme, fontSize: 20.0)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                  },
                ),
              )
            ],
          )),
    );
  }
}