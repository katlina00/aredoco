import 'package:aredoco/domain/user.dart';
import 'package:aredoco/presentation/home_list/home_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'aredoco_model.dart';

class Aredoco extends StatelessWidget {
  AredocoModel aredocoModel = AredocoModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: aredocoModel.fetchUserData(),
    builder: (context,userDataSnapshot){
      if(userDataSnapshot.hasData){
        return FutureBuilder(
          future: aredocoModel.fetchUserPermissionList(),
          builder: (context, userPermissionSnapshot){
            if(userPermissionSnapshot.hasData){
              return HomeListPage(aredocoModel.userData, aredocoModel.permissions);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        );
      }else{
        return Center(child: CircularProgressIndicator());
      }
    },
    );
  }
}
