import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_put_model.dart';

class AddPutPage extends StatelessWidget {
  AddPutPage(this.homeInformationId);
  String homeInformationId = '';

  @override
  Widget build(BuildContext context) {
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
                      maxLength: 10,
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
