import 'package:aredoco/domain/user.dart';
import 'package:aredoco/presentation/home_list/add_home/add_home_page.dart';
import 'package:aredoco/presentation/home_list/home_list_page.dart';
import 'package:aredoco/presentation/home_list/put_list/put_list_page.dart';
import 'package:aredoco/presentation/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

//flutter run C:\develop\aredoco\aredoco\lib\presentation\main\main.dart
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: アプリを開いたユーザーの状態で画面を出し分ける。
    // TODO: ログインキャッシュがある場合→HomeListPage()
    // TODO: ログインキャッシュがない場合→ログインページ
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
