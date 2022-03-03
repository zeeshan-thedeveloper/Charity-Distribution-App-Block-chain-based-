import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> getBalanceByAccountAddress(
    String accountAddress) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${GET_BALANCE_BY_ACCOUNT_ADDRESS}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'accountAddress': accountAddress,
    }),
  );
  print("inside api");
  print(response.body);
  return RecievedResponse.fromJson(jsonDecode(response.body));
}
