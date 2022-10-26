import 'package:flutter/material.dart';
import 'package:gestion_film/controller/user_controller.dart';
import 'package:gestion_film/screens/film_home_screen.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../model/auth_response.dart';
import '../util/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/img/logo_app.png')),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nom utilisateur',
                    hintText: 'Entrer le nom d' 'utilisateur'),
                controller: _usernameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mot de passe',
                    hintText: 'Entrer le mot passe'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  ProgressDialog dialog = ProgressDialog(
                    context,
                    type: ProgressDialogType.normal,
                    textDirection: TextDirection.ltr,
                    isDismissible: true,
                  );

                  dialog.update(
                    progress: 0.0,
                    message: "Connexion encours...",
                    progressWidget: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const CircularProgressIndicator()),
                    maxProgress: 100.0,
                    progressTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400),
                    messageTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600),
                  );

                  dialog.show();
                  if (_usernameController.text.isNotEmpty ||
                      _passwordController.text.isNotEmpty) {
                    UserController()
                        .login(
                            _usernameController.text, _passwordController.text)
                        .then((authResponse) => {
                              if (authResponse != null &&
                                  authResponse.token.isNotEmpty)
                                {
                                  setDataToSharedPreferences(authResponse.token, "token").then((value) =>{
                                    setDataToSharedPreferences(authResponse.username, "username").then((value) => {
                                      dialog.hide().then((value) => {
                                        Navigator.pushReplacement(context, MaterialPageRoute(
                                            builder: (_) => FilmHomePage(
                                                title: widget.title)))
                                      })
                                    })
                                  })
                                }
                              else
                                {
                                  dialog.hide().then((value) => {
                                        alert(context,
                                            title: const Text(
                                                "Merci de verifier le nom d'utilisateur ou le mot de passe"))
                                      })
                                }
                            })
                        .catchError((error) => {
                              dialog.hide().then((value) => {
                                alert(context,
                                    title: const Text("Erreur de connexion"))
                              })
                            });
                  } else {
                    dialog.hide().then((value) => {
                    alert(context,
                    title: const Text(
                    "Merci de remplir les formulaire de connexion"))
                    });
                  }
                },
                child: const Text(
                  'Connexion',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('Nouveau Utilisateur? Creation de Compte')
          ],
        ),
      ),
    );
  }
}
