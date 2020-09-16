import 'package:aredoco/domain/user.dart';
import 'package:aredoco/presentation/home_list/home_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'aredoco_model.dart';

class Aredoco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, // erase debug ribbon
      title: 'aredoco?',
      home: ChangeNotifierProvider<AredocoModel>(
        create: (_) => AredocoModel()..fetchUserData(),
        child: Consumer<AredocoModel>(
          builder: (context, model, child) {
            return HomeListPage(model.uid, model.userName, model.eMailAddress);
          },
        ),
      ),
    );
  }
}
