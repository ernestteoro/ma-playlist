import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String BASE_URL ="http://playlist-env.eba-mh93uppr.us-east-2.elasticbeanstalk.com";

String username='';
String token ='';


void showCustomeDialog(BuildContext context,String headerText,bool barrierDismissibleValue){
  showDialog(
      context: context,
      barrierDismissible: barrierDismissibleValue,
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: Text(headerText),
          content:const Text("Connexion encours ....."),
          backgroundColor: Colors.blue,
        );
      }
  ).then((val){
  });
}


// function to get data from share`dPreferences
Future getDataFromSharedPreferences(var element) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(element.runtimeType==bool){
    return await sharedPreferences.getBool(element).toString();
  }
  else if(element.runtimeType==int){
    return await sharedPreferences.getInt(element).toString();
  }
  else if(element.runtimeType==String){
    return await sharedPreferences.get(element).toString();
  }

}

// function to set data in shared preferences
Future<bool> setDataToSharedPreferences(var data, String element) async{

  bool saved=false;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(data.runtimeType==bool){
    await sharedPreferences.setBool(element, data).then((val){
      saved=data;
    });
  }
  if(data.runtimeType==int){
    await sharedPreferences.setInt(element, data).then((val){
      saved=true;
    });
  }
  if(data.runtimeType==String){
    await sharedPreferences.setString(element, data).then((val){
      saved=true;
    });
  }
  return saved;
}


