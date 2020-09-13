import 'package:aredoco/presentation/home_list/put_list/put_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_home/add_home_page.dart';
import 'home_list_model.dart';

class HomeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // erase debug ribbon
      title: 'aredoco?',
      home: ChangeNotifierProvider<HomelistModel>(
        create: (_) => HomelistModel()
          ..fetchHomeNameList()
          ..fetchUserName()
          ..fetchUserEmailAddress(),
        child: Consumer<HomelistModel>(
          builder: (context, model, child) {
            final homes = model.homes;
            final listTiles = homes
                .map(
                  (home) => ListTile(
                    title: Text(home.homeName + ' ' + home.documentId),
                    onTap: () async {
                      // 片付けリスト画面に遷移
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PutListPage(home.documentId, home.homeName),
                        ),
                      );
                    },
                  ),
                )
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: Text(model.userName + 'さんのホーム一覧'),
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
                      builder: (context) => AddHomePage(model.eMailAddress),
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
