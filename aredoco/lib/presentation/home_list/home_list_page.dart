import 'package:aredoco/presentation/home_list/put_list/put_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_home/add_home_page.dart';
import 'home_list_model.dart';

class HomeListPage extends StatelessWidget {
  String uid;
  String userName;
  String eMailAddress;

  HomeListPage(this.uid, this.userName, this.eMailAddress);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<HomeListModel>(
        create: (_) => HomeListModel(eMailAddress)..fetchHomeNameList(),
        child: Consumer<HomeListModel>(
          builder: (context, model, child) {
            final homes = model.homes;
            final listTiles = homes
                .map(
                  (home) => ListTile(
                    title: Text(home.homeName),
                    onTap: () async {
                      // 片付けリスト画面に遷移
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PutListPage(home.homeName),
                        ),
                      );
                    },
                  ),
                )
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: Text(userName + 'さんのホーム一覧'),
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
                      builder: (context) => AddHomePage(eMailAddress),
                      fullscreenDialog: true,
                    ),
                  );
                  model.fetchHomeNameList();
                },
                icon: Icon(Icons.add),
                label: Text('ホームを追加する'),
              ),
            );
          },
        ),
      ),
    );
  }
}
