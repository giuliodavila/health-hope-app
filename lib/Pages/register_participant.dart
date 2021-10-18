import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hope_app/Pages/list_participants.dart';

class RegisterParticipant extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("users").doc().set({
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
          title: Text('Registro del Participante'),
          centerTitle: true,
        ),
        body: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height: 10),
                  // Text(
                  //   "Registrar Participante",
                  //   style: TextStyle(
                  //       fontSize: 26,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.blue),
                  // ),
                  // Center(
                  //     child: Image.asset('assets/logo-upeu-chat.png',
                  //         width: 120, height: 120)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: name,
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: true,
                    autocorrect: true,
                    controller: surname,
                    decoration: InputDecoration(
                      labelText: "Apellidos",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Correo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 400,
                    height: 55,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.green,
                      child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        create();
                        name.clear();
                        surname.clear();
                        email.clear();
                        password.clear();
                      },
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListParticipants()));
                          },
                          child: Text("Ver participantes",
                              style: TextStyle(color: Colors.blue)))
                    ],
                  )
                ],
              ),
            )));
  }
}

// final firebase = FirebaseFirestore.instance;
//
// create() async {
//   try{
//     await firebase.collection("users").doc().set({
//       "name": name.text,
//       "surname": surname.text,
//       "email": email.text,
//       "password": password.text
//     });
//   } catch(e){
//     print(e);
//   };
// }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text('Registro del Participante'),
//       centerTitle: true,
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//           children: [
//             TextField(
//               controller: name,
//               decoration: InputDecoration(
//                   labelText: "Nombres",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)
//                   )
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: surname,
//               decoration: InputDecoration(
//                   labelText: "Apellidos",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)
//                   )
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: email,
//               decoration: InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)
//                   )
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: password,
//               decoration: InputDecoration(
//                   labelText: "Contraseña",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)
//                   )
//               ),
//             ),
//             ElevatedButton(
//                 style: TextButton.styleFrom(backgroundColor: Colors.green),
//                 onPressed: () {
//                   // create();
//                   name.clear();
//                   surname.clear();
//                   email.clear();
//                   password.clear();
//                 },
//                 child: Text('Registrar')),
//             Column(
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ParticipantsList()));
//                     },
//                     child: Text("Ver participantes",
//                         style: TextStyle(color: Colors.blue)))
//               ],
//             )
//           ]
//       )
//     )
//   );
// }
