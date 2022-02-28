import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<http.Response> sendAmountFromOneAccountToAnother(
    String senderAccountAddress,
    String recieverAccountAddress,
    String senderAccountPin,
    String ammount,
    String gasLimit,
    String gasPrice) async {
  final response = await http.post(
    Uri.parse(
        'http://${IPADDRESS}:${PORT}/${SEND_AMOUNT_FROM_ONE_ACCOUNT_TO_ANOTHER}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'senderAccountAddress': senderAccountAddress,
      'recieverAccountAddress': recieverAccountAddress,
      'senderAccountPin': senderAccountPin,
      'ammount': ammount,
      'gasLimit': gasLimit,
      'gasPrice': gasPrice
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
