import 'package:aredoco/presentation/home_list/home_list_page.dart';
import 'package:aredoco/presentation/login/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginPage extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<LoginModel>(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  // メールアドレス入力欄
                  Container(
                    child: TextFormField(
                      controller: mailController,
                      onChanged: (text) {
                        model.mailAddress = text;
                      },
                      enabled: true,
                      maxLength: 100,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: 'メールアドレスを入力',
                        labelText: 'メールアドレス *',
                      ),
                    ),
                  ),
                  // パスワード入力欄
                  Container(
                    child: TextFormField(
                      controller: passwordController,
                      onChanged: (text) {
                        model.password = text;
                      },
                      enabled: true,
                      maxLength: 10,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: 'パスワードを入力',
                        labelText: 'パスワード *',
                      ),
                    ),
                  ),
                  // 追加ボタン
                  Container(
                    child: RaisedButton(
                      child: Text('ログイン'),
                      onPressed: () async {
                        try {
                          await model.signUp();
                          showDialog(
                            //ここリファクタリング対象（共用できるようにまとめとく）
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ログインしました'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeListPage(),
                                          fullscreenDialog: true,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } catch (e) {
                          showDialog(
                            //ここリファクタリング対象（共用できるようにまとめとく）
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(e.toString()),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  // サインアップリンク
                  Container(
                    child: RaisedButton(
                      child: Text('新規登録はこちら'),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
