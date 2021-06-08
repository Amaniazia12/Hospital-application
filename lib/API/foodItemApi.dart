import 'dart:io';
import 'package:hospital_application/Models/foodModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<FoodItem>> getFood() async {
  final Dataa = await http
      .get(Uri.parse("http://192.168.1.4:8000/Items/FoodItemAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<FoodItem> food_all = [];

  for (var t in jsonData) {
    food_all.add(FoodItem.fromJson(t));
  }
  return food_all;
}
