import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListParticipants extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //final _formKey = GlobalKey<FormState>();
  final userReference = FirebaseDatabase.instance.reference().child('users');
  final firebase = FirebaseFirestore.instance;

  delete() async {
    try {
      await firebase.collection("users").doc().delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Participante'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: 300,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: StreamBuilder<QuerySnapshot>(
              stream: firebase.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: (ListTile(
                              title: Text(x['name'] + ' ' + x['surname']),
                              subtitle: Text(x['email']),
                            )),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {

                              }),
                        ],
                      );
                    },
                  );
                } else {
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

// void _showDialog(context, position) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Atención'),
//         content: Text('¿Estás seguro que quieres eliminar este usuario?'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.delete,
//               color: Colors.purple,
//             ),
//             onPressed: () {},
//           ),
//           new FlatButton(
//             child: Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
