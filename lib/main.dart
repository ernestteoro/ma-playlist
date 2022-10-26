import 'package:flutter/material.dart';
import 'package:gestion_film/screens/film_home_screen.dart';
import 'package:gestion_film/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Playlist de Film',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(title: 'Ma Playlist de Film'),
    );
  }
}
