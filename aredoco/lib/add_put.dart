import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_home_model.dart';
import 'add_put_model.dart';

class AddPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPutModel>(
      create: (_) => AddPutModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新しい片付け場所の追加'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<AddHomeModel>(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  // ホーム名
                  Container(
                    child: TextFormField(
                      onChanged: (text) {
                        model.homeName = text;
                      },
                      enabled: true,
                      maxLength: 10,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.home),
                        hintText: '例：ガムテープ',
                        labelText: '品目名 *',
                      ),
                    ),
                  ),
                  // 追加ボタン
                  Container(
                    child: RaisedButton(
                      child: Text('追加'),
                      onPressed: () async {
                        try {
                          await model.addHomeDataBase();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ホーム名を保存しました！'),
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
                          Navigator.of(context).pop();
                        } catch (e) {
                          showDialog(
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
                              });
                        }
                      },
                    ),
                  ),
                  // 権限設定領域
                  Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
