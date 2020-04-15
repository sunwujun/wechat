import 'package:app/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 140.0,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
//                  verticalDirection: VerticalDirection.up,
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
                        "手机号注册",
                        style: TextStyle(
                            color: AppColors.fontBlack, fontSize: 30.0),
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
                padding: const EdgeInsets.only(top: 1.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flex(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Text("昵称",
                                        style: TextStyle(
                                            color: AppColors.fontBlack,
                                            fontSize: 20.0)),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: TextFormField(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        cursorColor: AppColors.lightColorTheme,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '例如：陈晨',
                                          hintStyle: TextStyle(
                                              color: AppColors.fontLightGray),
                                        )),
                                  ),
                                ],
                              ),
                              Divider(
                                  height: 1, color: AppColors.fontLightGray),
                            ])),
                    Expanded(flex: 1, child: Text("1"))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text("国家/地区",
                        style: TextStyle(
                            color: AppColors.fontBlack, fontSize: 20.0)),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text("中国大陆（+86）",
                        style: TextStyle(
                            color: AppColors.lightColorTheme, fontSize: 20.0)),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("手机号",
                          style: TextStyle(
                              color: AppColors.fontBlack, fontSize: 20.0)),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          cursorColor: AppColors.lightColorTheme,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请填写手机号',
                            hintStyle:
                                TextStyle(color: AppColors.fontLightGray),
                          )),
                    ),
                  ],
                )),
            Divider(height: 1, color: AppColors.fontLightGray),
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("密码",
                          style: TextStyle(
                              color: AppColors.fontBlack, fontSize: 20.0)),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          cursorColor: AppColors.lightColorTheme,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请填写手机号',
                            hintStyle:
                                TextStyle(color: AppColors.fontLightGray),
                          )),
                    ),
                  ],
                )),
            Divider(height: 1, color: AppColors.fontLightGray),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "《软件许可及服务协议》",
                style: TextStyle(fontSize: 18, color: AppColors.fontGrayBlue),
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
                          child: Text("注册",
                              style: new TextStyle(
                                  color: AppColors.colorWhite, fontSize: 20.0)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {}),
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
