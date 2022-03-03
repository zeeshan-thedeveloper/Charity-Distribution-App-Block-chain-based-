import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/LoginResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<LoginResponse> authenticateUser(
    String email, String password, String accountType) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${SIGNIN_URL}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "password": password,
      "accountType": accountType
    }),
  );

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login user');
  }
}
