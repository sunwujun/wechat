import 'package:app/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileLoginNext extends StatefulWidget {
  final String phone;

  MobileLoginNext(this.phone);
  @override
  State<StatefulWidget> createState() => _MobileLoginNextState();
}

class _MobileLoginNextState extends State<MobileLoginNext> {
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 150.0,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: AppColors.fontBlack,
                              size: 30,
                            ),
                            onPressed: () => Navigator.pop(context))),
                    Spacer(
                      flex: 3,
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "手机号登录",
                        style: TextStyle(
                            color: AppColors.fontBlack, fontSize: 33.0),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("手机号",
                          style: TextStyle(
                              color: AppColors.fontBlack, fontSize: 22.0)),
                    ),
                    Expanded(
                        flex: 7,
                        child: Text(
                          this.widget.phone,
                          style: TextStyle(
                              color: AppColors.fontLightGray, fontSize: 21),
                        )),
                  ],
                )),
            Divider(height: 10, color: AppColors.fontLightGray),
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("密码",
                          style: TextStyle(
                              color: AppColors.fontBlack, fontSize: 21.0)),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                        controller: _pwdController,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        cursorColor: AppColors.lightColorTheme,
                        autofocus: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请填写微信密码',
                          hintStyle: TextStyle(color: AppColors.fontLightGray),
                        ),
                      ),
                    ),
                  ],
                )),
            Divider(height: 10, color: AppColors.lightColorTheme),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "用短信验证码登录",
                style: TextStyle(fontSize: 20, color: AppColors.fontGrayBlue),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          height: 50,
                          child: FlatButton(
                              color: AppColors.lightColorTheme,
                              highlightColor: AppColors.darkColorTheme,
                              colorBrightness: Brightness.dark,
                              splashColor: Colors.grey,
                              disabledColor: AppColors.disabledButton,
                              child: Text("登录",
                                  style: new TextStyle(
                                      color: AppColors.colorWhite, fontSize: 20.0)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              onPressed: _mobileLogin),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future _mobileLogin() async {

  }



}