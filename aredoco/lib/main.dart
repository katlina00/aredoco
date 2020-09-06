import 'package:aredoco/aredoco_add_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(Aredoco());
}

class Aredoco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // erase debug ribbon
      title: 'aredoco?',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AredocoHomeList(),
    );
  }
}

class AredocoHomeList extends StatelessWidget{

  String title = 'ホームリスト';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          // ホーム追加用画面に遷移
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:(context) => aredocoAddHome(),
            )
          );
        },
        icon:Icon(Icons.add),
          label:Text('ホームを追加する'),
      ),
    );
  }
}