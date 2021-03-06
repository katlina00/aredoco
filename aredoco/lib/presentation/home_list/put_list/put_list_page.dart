import 'package:aredoco/presentation/home_list/put_list/put_detail/put_detail_page.dart';
import 'package:aredoco/presentation/home_list/put_list/put_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_put/add_put_page.dart';

class PutListPage extends StatelessWidget {
  String homeName;
  String homeInformationId;

  PutListPage(this.homeName,this.homeInformationId);

  @override
  Widget build(BuildContext context) {
    debugPrint('PutListPage:' + 'homeName= ' + homeName + ' / ' + 'homeInformationId= ' + homeInformationId);
    return ChangeNotifierProvider<PutListModel>(
      create: (_) => PutListModel(homeInformationId)..fetchPutList(),
      child: Consumer<PutListModel>(
        builder: (context, model, child) {
          final puts = model.puts;
          final listTiles = puts
              .map(
                (put) => ListTile(
                  title: Text(put.objectName),
                  onTap: () async {
                    // 片付けリスト画面に遷移
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PutDetailPage(put.documentId, put.objectName),
                      ),
                    );
                  },
                ),
              )
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text(homeName + 'の片付けリスト'),
            ),
            body: ListView(
              children: listTiles,
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                // ホーム追加用画面に遷移
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPutPage(homeInformationId,'',''),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchPutList();
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
