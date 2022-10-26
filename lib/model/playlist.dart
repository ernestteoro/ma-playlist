import 'package:gestion_film/model/user.dart';

class Playlist {
  int id;
  String name;
  String idFilms;
  DateTime createdAt;
  DateTime updatedAt;

  Playlist({
    required this.id,
    required this.name,
    required this.idFilms,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      name: json['name'],
      idFilms: json['idFilms'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
