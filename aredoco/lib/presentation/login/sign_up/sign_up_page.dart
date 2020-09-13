import 'package:aredoco/presentation/login/sign_up/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('サインアップ'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<SignUpModel>(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  // メールアドレス入力欄
                  Container(
                    child: TextFormField(
                      controller: mailController,
                      onChanged: (text) {
                        model.emailAddress = text;
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
                      child: Text('登録'),
                      onPressed: () async {
                        try {
                          await model.signUp();
                          showDialog(
                            //ここリファクタリング対象（共用できるようにまとめとく）
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('登録しました'),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
