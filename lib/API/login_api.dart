import 'package:hospital_application/Models/Login_User.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login_Api {
  /**
  Future<LoginRequestModel> login(LoginRequestModel requestModel) async {
    String url = "https://robohub.pythonanywhere.com/api-token-auth/" ;
    final response = await http.post("https://robohub.pythonanywhere.com/api-token-auth/" , body: requestModel.toJson()) ;

    final data = json.decode(response.body);
    if (response.statusCode==200  || response.statusCode==400)
      {
       print (data['token']);
        return data ;
      }
    else{
      print (" error");
      return null ;
    }
  }**/

 login(String username, String password) async {
    final response = await http.post(
        Uri.parse("https://robohub.pythonanywhere.com/api-token-auth/"),
        body: {"username": username, "password": password},
        headers: {});

    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(data['token']);
      return data;
    } else {
      print(" errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

      return "error";
    }
  }
}
