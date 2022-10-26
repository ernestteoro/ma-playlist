import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gestion_film/controller/playlist_controller.dart';

import '../model/playlist.dart';

class UserPlaylistHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _UserPlaylistHomePage();
}

class _UserPlaylistHomePage extends State<UserPlaylistHomePage>{

  late List<Playlist> playlist=[];
  @override
  void initState() {
    PlaylistController().playlist().then((value) => {
      setState((){
        playlist =value!;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: playlist.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Playlist pl = playlist[index];
            return ListTile(
              title: Text('${pl.name}'),
              subtitle: Text('${pl.id}'),
            );
          },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}