import 'dart:convert';
import 'package:crudapi/models/home_model.dart';
import 'package:http/http.dart' as http;

getUser() async {
  final url = Uri.parse('https://maaz-api.tga-edu.com/api/users');
  final getData = await http.get(url);
  final responseData = jsonDecode(getData.body);
  return HomeModel.fromJson(responseData);
}

deleteUser({required id}) async {
  await http.delete(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

addUser(Data model) async {
  await http.post(
    Uri.parse("https://maaz-api.tga-edu.com/api/users"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(model.toJson()),
  );
}

updateUser({required Data model, required id}) async {
  await http.put(
    Uri.parse("https://maaz-api.tga-edu.com/api/users/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(model.toJson()),
  );
}
