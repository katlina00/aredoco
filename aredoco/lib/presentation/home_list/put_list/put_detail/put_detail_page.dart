import 'package:aredoco/presentation/home_list/put_list/put_detail/put_detail_edit/put_detail_edit_page.dart';
import 'package:aredoco/presentation/home_list/put_list/put_detail/put_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutDetailPage extends StatelessWidget {
   String putDocumentId;
  String objectName;

  PutDetailPage(this.putDocumentId, this.objectName);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PutDetailModel>(
      create: (_) => PutDetailModel(putDocumentId)..fetchPutDetail(),
      child: Consumer<PutDetailModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(objectName + 'の片付け場所の詳細'),
            ),
            body: Column(
              children: <Widget>[
                Text('品目名: ' + model.doc['object_name']),
                Text('フロア: ' + model.doc['floor'].toString()),
                Text('カテゴリ: ' + model.doc['category']),
                Text('詳細: ' + model.doc['detail_information']),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                // ホーム追加用画面に遷移
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PutDetailEditPage(model.doc['object_name'],
                        model.doc['floor'], model.doc['category'], model.doc['detail_information']),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchPutDetail();
              },
              icon: Icon(Icons.edit),
              label: Text('編集'),
            ),
          );
        },
      ),
    );
  }
}
