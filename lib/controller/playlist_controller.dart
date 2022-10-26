
import 'dart:convert';

import '../model/playlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
import 'dart:io';

import '../util/utils.dart';

class PlaylistController{

  Future<List<Playlist>?> playlist() async {

    var token =  await getDataFromSharedPreferences("token").catchError((error){
      print(error);
    });
    List<Playlist> playlists=[];
    final response = await http.get(
      Uri.parse('$BASE_URL/v1/playlists/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token.toString()}',
      });

    print(response.statusCode);

    if(response.statusCode==200 && response.body.isNotEmpty){
      print(response.body);
      List<dynamic> resultMap =converter.json.decode(response.body);
      resultMap.forEach((element) {
        var playlist = Playlist.fromJson(element);
        playlists.add(playlist);
      });
      return playlists;
    }
    return null;
  }
}