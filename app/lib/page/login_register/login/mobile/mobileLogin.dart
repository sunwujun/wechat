import 'package:app/common/style/colors.dart';
import 'package:app/routers/application.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MobileLoginPageState();
}


class _MobileLoginPageState extends State<MobileLoginPage> {
  bool _isButtonDisabled;
  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _isButtonDisabled = true;
  }

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
//                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: IconButton(icon: Icon(
                          Icons.close,
                          color: AppColors.fontBlack,
                          size: 30,
                        ), onPressed: () => Navigator.pop(context))),
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
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text("国家/地区",
                      style: TextStyle(
                          color: AppColors.fontBlack, fontSize: 22.0)),
                ),
                Expanded(
                  flex: 7,
                  child: Text("中国大陆（+86）",
                      style: TextStyle(
                          color: AppColors.lightColorTheme, fontSize: 22.0)),
                ),
              ],
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
                      child: TextFormField(
                        controller: _controller,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        cursorColor: AppColors.lightColorTheme,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请填写手机号',
                          hintStyle:
                          TextStyle(color: AppColors.fontLightGray),
                        ),
                        onChanged: (value){
                          RegExp mobile = new RegExp(r"[1][34578]\d{9}$");
                          setState(() {
                            if (mobile.hasMatch(value)){
                              print("手机号格式正确");
                              _isButtonDisabled = false;
                            }else{
                              print("不正确");
                              _isButtonDisabled = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Divider(height: 10, color: AppColors.fontLightGray),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "用微信/QQ号/邮箱登录",
                style: TextStyle(fontSize: 20, color: AppColors.fontGrayBlue),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Container(
                      height: 50,
                      child: FlatButton(
                          color: AppColors.lightColorTheme,
                          highlightColor: AppColors.darkColorTheme,
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          disabledColor: AppColors.disabledButton,
                          child: Text("下一步",
                              style: new TextStyle(
                                  color: AppColors.colorWhite, fontSize: 20.0)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: _isButtonDisabled ? null : _next),
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _next(){
    print('/${Routers.mobileLoginNext}?phone=${_controller.text}');
    Application.router.navigateTo(context,
        '/${Routers.mobileLoginNext}?phone=${_controller.text}');
  }
}

