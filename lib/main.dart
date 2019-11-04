import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

//void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));
void main() {
  debugPaintSizeEnabled = false;
  runApp(LoginPage());
}


Widget _widgetForRoute(String route) {
  switch(route) {
    case 'login':
      return new LoginPage();
    case 'home':
      return null;
    default :
      return Center(
        child: Text('无效路由'),
      );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: loginView(),
      ),
    );
  }
}

class loginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginViewState();
  }
//  _loginViewState createState(){
//    return _loginViewState();
//  }
}
class _loginViewState extends State<loginView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120.0,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30.0),
              color: Colors.white,
              child: Icon(Icons.access_alarm),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                child: buildForm(),
              ),
            )
          ],
        )
      ]
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  Widget buildForm(){
    return Form(
    key: formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: nameController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或者邮箱",
              icon: Icon(Icons.person)),
              validator: (v){
                return v.trim().length > 0 ? null : "用户名不可为空";
            }),
          TextFormField(
            autofocus: false,
            controller: pwdController,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "你的登录密码",
              icon: Icon(Icons.lock)),
            obscureText: true,
            validator: (v){
             return v.trim().length > 5 ? null : "密码不能少于6位"; 
            }),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("登录"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: (){
                     if((formKey.currentState as FormState).validate()){
                       print("提交");
                     } 
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

