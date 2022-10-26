
import 'dart:convert';

import 'package:gestion_film/model/user.dart';
import 'package:gestion_film/util/utils.dart';

import '../model/auth_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;

class UserController {

  Future <AuthResponse?> login(String username, String password) async {

    print(" Inside login mehtod");

    final response = await http.post(
      Uri.parse('$BASE_URL/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password":password
      }),
    );

    print(" Inside login mehtod 2");

    print(response.statusCode);
    //print(response.body);
    if(response.statusCode==202){
      var authResponse = AuthResponse.fromJson(converter.jsonDecode(response.body));
      return authResponse;
    }
    return null;
  }
}