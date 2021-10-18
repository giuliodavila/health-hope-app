import 'package:flutter/material.dart';
import 'package:health_hope_app/Pages/fierbase_service.dart';
import 'package:health_hope_app/Pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //instancia de la clase Service
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    "Regístrate",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Center(
                      child: Image.asset('assets/health-hope.jpg',
                          width: 120, height: 120)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    autofocus: true,
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Correo Electrónico",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        helperText: "tucorreo@ejemplo.com"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 400,
                    height: 55,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue,
                      child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        //Si el correo y la contraseña no estan vacias
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          service.createUser(context, emailController.text,
                              passwordController.text);

                          pref.setString("email", emailController.text);
                        } else {
                          //Si estan los campos vacios mostrará un mensaje de advertencia
                          service.errorBox(context,
                              "los campos no deben estar vacíos, ingrese un correo electrónico y una contraseña válidos");
                        }
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
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("Tengo una cuenta, inicar sesión",
                              style: TextStyle(color: Colors.blue)))
                    ],
                  )
                ],
              ),
            )));
  }
}
