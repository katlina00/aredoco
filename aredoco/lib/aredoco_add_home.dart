import 'package:flutter/material.dart';

class AredocoAddHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新しいホームの追加'),
      ),
      body:Container(
        child:Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
          children: <Widget>[
            // ホーム名
            Container(
              child: TextFormField(
                enabled: true,
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.home),
                  hintText: '例：もふもふホーム',
                  labelText: 'ホーム名 *',
                ),
              ),
            ),
            // 追加ボタン
            Container(
                child:RaisedButton(
                  child:Text('追加'),
                  onPressed: (){
                    // TODO：ホーム名追加ロジック書く（DB接続してINSERT）
                  },
                ),
            ),
            // 権限設定領域
            Container(

            ),
          ],
        ),),

      ),
    );
  }
}
