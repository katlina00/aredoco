import 'package:aredoco/domain/put.dart';
import 'package:aredoco/presentation/home_list/put_list/put_detail/put_detail_edit/put_detail_edit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutDetailEditPage extends StatelessWidget {
  PutDetailEditPage(this.objectName, this.floor, this.category, this.detailInformation);

  String objectName = '';
  int floor = 0;
  String category = '';
  String detailInformation = '';

  @override
  Widget build(BuildContext context) {
    final objectNameTextEditingController = TextEditingController();
    objectNameTextEditingController.text = objectName;
    final floorTextEditingController = TextEditingController();
    floorTextEditingController.text = floor.toString();
    final categoryTextEditingController = TextEditingController();
    categoryTextEditingController.text = category;
    final detailInformationTextEditingController = TextEditingController();
    detailInformationTextEditingController.text = detailInformation;
    return ChangeNotifierProvider<PutDetailEditModel>(
      create: (_) => PutDetailEditModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('詳細の編集'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<PutDetailEditModel>(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  // 品目名
                  Container(
                    child: TextFormField(
                      controller: objectNameTextEditingController,
                      onChanged: (text) {
                        //todo
                      },
                      enabled: true,
                      maxLength: 50,
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
                  // フロア情報
                  Container(
                    child: TextFormField(
                      controller: floorTextEditingController,
                      onChanged: (text) {
                        //todo
                      },
                      enabled: true,
                      maxLength: 3,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.home),
                        hintText: '例：1',
                        labelText: 'フロア(階)',
                      ),
                    ),
                  ),
                  // カテゴリ
                  Container(
                    child: TextFormField(
                      controller: categoryTextEditingController,
                      onChanged: (text) {
                        //todo
                      },
                      enabled: true,
                      maxLength: 50,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.home),
                        hintText: '例：キッチン',
                        labelText: 'カテゴリ',
                      ),
                    ),
                  ),
                  // 詳細
                  Container(
                    child: TextFormField(
                      controller: detailInformationTextEditingController,
                      onChanged: (text) {
                        //todo
                      },
                      enabled: true,
                      maxLength: 100,
                      maxLengthEnforced: false,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.home),
                        hintText: '例：二番目の戸棚左奥',
                        labelText: '詳細',
                      ),
                    ),
                  ),
                  // 追加ボタン
                  Container(
                    child: RaisedButton(
                      child: Text('保存'),
                      onPressed: () async {
                        try {
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
