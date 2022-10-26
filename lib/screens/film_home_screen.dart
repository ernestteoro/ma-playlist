
import 'package:flutter/material.dart';
import 'package:gestion_film/screens/user_home_page.dart';
import 'package:gestion_film/screens/user_playlist.dart';

import 'film_home_page.dart';

class FilmHomePage extends StatefulWidget {
  const FilmHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FilmHomePage> createState() => _FilmHomePageState();
}

class _FilmHomePageState extends State<FilmHomePage> {

  int _currentIndex =0;
  final List<Widget> pages = [
    UserPlaylistHomePage(),
    UserHomePage(),
    UserFilmHomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add_check_rounded),
              tooltip:"Playlist",
            label: "Ma Playliste",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined),
              tooltip:"Film",
              label: "Film",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              tooltip:"Mon Compte",
              label: "Mon Compte",
          ),
          ],
        onTap:(index) => changeHomePage(index),
        elevation: 15.5,
        selectedItemColor: Colors.blue,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void changeHomePage(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}