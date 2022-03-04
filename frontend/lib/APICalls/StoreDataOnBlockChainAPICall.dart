import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> storeDataOnBlockChain(
    String dataToStore,
    String requestingAccountAddress,
    String contractAddress,
    String requestingAccountPin) async {
  final response = await http.post(
    Uri.parse('http://${IPADDRESS}:${PORT}/${STORE_DATA_ON_BLOCK_CHAIN}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'dataToStore': dataToStore,
      'requestingAccountAddress': requestingAccountAddress,
      'contractAddress': contractAddress,
      'requestingAccountPin': requestingAccountPin
    }),
  );
  return RecievedResponse.fromJson(jsonDecode(response.body));
}
