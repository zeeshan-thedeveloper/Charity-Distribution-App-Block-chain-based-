import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> createAccount(
    String email,
    String phoneNumber,
    String password,
    String pin,
    bool emailVerified,
    String displayName,
    String address,
    var onlineStatus,
    String photoUrl,
    bool disabled,
    String accountType,
    String firstName,
    String lastName,
    var description) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${CREATE_ACCOUNT}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'pin': pin,
      'emailVerified': emailVerified,
      'displayName': displayName,
      'address': address,
      'onlineStatus': onlineStatus,
      'photoUrl': photoUrl,
      'disabled': disabled,
      'accountType': accountType,
      'firstName': firstName,
      'lastName': lastName,
      'description': description
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return RecievedResponse.fromJson(jsonDecode(response.body));
  } else {
   print(response.body);
    return RecievedResponse.fromJson(jsonDecode(response.body));
  }
}
