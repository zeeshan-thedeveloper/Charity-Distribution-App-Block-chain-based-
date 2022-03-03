import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<http.Response> getDataFromBlockChain(
    String keyToFindData,
    String dataFetchRequestingAccountPin,
    String dataFetchRequestingAccountAddress,
    String contractAddress) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${GET_DATA_FROM_BLOCK_CHAIN}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'keyToFindData': keyToFindData,
      'dataFetchRequestingAccountPin': dataFetchRequestingAccountPin,
      'dataFetchRequestingAccountAddress': dataFetchRequestingAccountAddress,
      'contractAddress': contractAddress
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
