import 'package:flutter/material.dart';

class UserRegistrationHome extends StatefulWidget{

  bool origin=false;

  UserRegistrationHome({Key? key, required this.origin}): super(key: key);

  @override
  State<UserRegistrationHome> createState() => _UserRegistrationHome();
}


class _UserRegistrationHome extends State<UserRegistrationHome>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text("User registration page"),
      ),
    );
  }
}