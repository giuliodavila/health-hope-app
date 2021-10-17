import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hope_app/widget/navigation_drawer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    //drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Perfil'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
  );
}