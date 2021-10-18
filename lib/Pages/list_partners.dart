import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPartners extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("partners").doc().set({
        "name": name.text,
        "surname": surname.text,
        "email": email.text,
        "password": password.text
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de acompañantes'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: 300,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: StreamBuilder<QuerySnapshot>(
              stream: firebase.collection('partners').snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i){
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      return ListTile(
                          title: Text(x['name'] + ' ' + x['surname']),
                          subtitle: Text(x['email']),
                      );
                  },
                  );
                }else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },

            ),
          ),
        ));
  }
}
