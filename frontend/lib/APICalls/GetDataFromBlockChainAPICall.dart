import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> getDataFromBlockChain(
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
  return RecievedResponse.fromJson(jsonDecode(response.body));
}
