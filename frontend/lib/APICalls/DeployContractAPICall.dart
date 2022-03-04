import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> deployContract(String deployingAccountAddress,
    String deployingAccountPin, String userUid) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${DELOY_CONTRACT}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'deployingAccountAddress': deployingAccountAddress,
      'deployingAccountPin': deployingAccountPin,
      'userUid': userUid
    }),
  );
  return RecievedResponse.fromJson(jsonDecode(response.body));
}
