import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login_Api {
  login(String username, String password) async {
    final response = await http.post(
        Uri.parse("https://robohub.pythonanywhere.com/api-token-auth/"),
        body: {"username": username, "password": password},
        headers: {});

    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      //print(data['token']);
      return data;
    }
  }
}
