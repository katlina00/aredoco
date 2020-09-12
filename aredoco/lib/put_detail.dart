import 'package:aredoco/put_detail_model.dart';
import 'package:aredoco/put_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_put.dart';

class PutDetail extends StatelessWidget {
  PutDetail(this.putDocumentId);

  String putDocumentId = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PutDetailModel>(
      create: (_) => PutDetailModel(putDocumentId)..fetchPutDetail(),
      child: Consumer<PutDetailModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('片付けの詳細'),
            ),
            body: Text(model.doc.toString()),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                // ホーム追加用画面に遷移
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => ModifyPutDetail(putDocumentId),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchPutDetail();
              },
              icon: Icon(Icons.add),
              label: Text('品目を追加する'),
            ),
          );
        },
      ),
    );
  }
}
