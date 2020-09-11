import 'package:aredoco/add_home.dart';
import 'package:aredoco/main_model.dart';
import 'package:aredoco/put.dart';
import 'package:aredoco/put_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  //debugPaintSizeEnabled = true; //show grid
  runApp(HomeList());
}

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // erase debug ribbon
      title: 'aredoco?',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..fetchHomeNameList(),
        child: Consumer<MainModel>(
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
                          builder: (context) => PutList(home.documentId),
                        ),
                      );
                    },
                  ),
                )
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: Text(model.userName + model.appBarTitleParts),
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
                      builder: (context) => AddHome(),
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
