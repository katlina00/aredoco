import 'package:aredoco/put_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_put.dart';

class PutList extends StatelessWidget {
  String homeInformationId = ''; // test

  PutList(this.homeInformationId); // test

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PutListModel>(
      create: (_) => PutListModel(homeInformationId)..fetchPutList(),
      child: Consumer<PutListModel>(
        builder: (context, model, child) {
          final puts = model.puts;
          final listTiles = puts
              .map(
                (put) => ListTile(
                  title: Text(put.objectName + ' ' + put.homeInformationId),
                ),
              )
              .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('片付けリスト'),
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
                    builder: (context) => AddPut(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchPutList();
              },
              icon: Icon(Icons.add),
              label: Text('片付けリストを追加する'),
            ),
          );
        },
      ),
    );
  }
}
