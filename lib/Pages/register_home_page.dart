import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hope_app/Pages/register_medical_staff.dart';
import 'package:health_hope_app/Pages/register_participant.dart';
import 'package:health_hope_app/Pages/register_partner.dart';
import 'package:health_hope_app/widget/button_widget.dart';
import 'package:health_hope_app/widget/header_widget.dart';

class RegisterHome extends StatefulWidget{
  @override
  _RegisterHome createState() => _RegisterHome();
}

class _RegisterHome extends State<RegisterHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build (BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      title: Text("Registrar"),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(

            text: 'Registrar participante',
            onClicked: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterParticipant())
            )
          ),
          SizedBox(height: 10),
          ButtonWidget(
              text: 'Registrar acompañante',
              onClicked: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPartner())
              )
          ),
          SizedBox(height: 10),
          ButtonWidget(
              text: 'Registrar staff Médico',
              onClicked: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterMedicalStaff())
              )
          )
        ],
      ),
    ),
  );
}