import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:json_serializable/json_serializable.dart';

Future<http.Response> authenticateUser(
    String email, String password, String accountType) async {
  final response = await http.post(
    Uri.parse('http://localhost:${PORT}/${SIGNIN_URL}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'accountType': accountType
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // return Album.fromJson(jsonDecode(response.body));
    return throw Exception('Failed to create album.');
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}