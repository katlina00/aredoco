import 'package:aredoco/presentation/home_list/put_list/put_detail/put_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PutDetailPage extends StatelessWidget {
  PutDetailPage(this.putDocumentId, this.objectName);

  String putDocumentId = '';
  String objectName = '';

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
              icon: Icon(Icons.edit),
              label: Text('編集'),
            ),
          );
        },
      ),
    );
  }
}
