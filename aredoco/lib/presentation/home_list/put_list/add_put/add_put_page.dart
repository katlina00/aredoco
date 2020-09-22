import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_put_model.dart';

class AddPutPage extends StatelessWidget {
  String homeInformationId;
  String userId;
  String UserName;

  AddPutPage(this.homeInformationId, this.userId, this.UserName);

  @override
  Widget build(BuildContext context) {
    debugPrint('AddPutPage:' + 'homeInformationId= ' + homeInformationId);
    return ChangeNotifierProvider<AddPutModel>(
      create: (_) => AddPutModel(homeInformationId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新しい片付け場所の追加'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<AddPutModel>(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  // ホーム名
                  Container(
                    child: TextFormField(
                      onChanged: (text) {
                        model.objectName = text;
                      },
                      enabled: true,
                      maxLength: 50,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: '例：ガムテープ',
                        labelText: '品目名 *',
                      ),
                    ),
                  ),
                  // フロア情報
                  Container(
                    child: TextFormField(
                      onChanged: (text) {
                        model.floor = text as int;
                      },
                      enabled: true,
                      maxLength: 3,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: '1',
                        labelText: 'フロア(階)',
                      ),
                    ),
                  ),
                  // カテゴリ
                  Container(
                    child: TextFormField(
                      onChanged: (text) {
                        model.category = text;
                      },
                      enabled: true,
                      maxLength: 50,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: '例：キッチン用品',
                        labelText: 'カテゴリ',
                      ),
                    ),
                  ),
                  // 詳細欄
                  Container(
                    child: TextFormField(
                      onChanged: (text) {
                        model.detailInformation = text;
                      },
                      enabled: true,
                      maxLength: 100,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.block),
                        hintText: '例：上から二番目の引き出し左奥',
                        labelText: '詳細',
                      ),
                    ),
                  ),
                  // 追加ボタン
                  Container(
                    child: RaisedButton(
                      child: Text('追加'),
                      onPressed: () async {
                        try {
                          await model.addPutDetailDataBase();
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('保存しました！'),
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
