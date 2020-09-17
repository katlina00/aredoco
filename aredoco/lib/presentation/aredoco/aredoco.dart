import 'package:aredoco/domain/user.dart';
import 'package:aredoco/presentation/home_list/home_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'aredoco_model.dart';

class Aredoco extends StatelessWidget {
  AredocoModel model = AredocoModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: model.fetchUserData(),
    builder: (context,snapshot){
      if(snapshot.hasData){
        return HomeListPage(model.uid,model.userName,model.eMailAddress);
      }else{
        return Center(child: CircularProgressIndicator());
      }
    },
    );
  }
}
