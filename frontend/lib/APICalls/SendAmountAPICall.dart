import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:http/http.dart' as http;
// import 'package:json_serializable/json_serializable.dart';

Future<RecievedResponse> sendAmountFromOneAccountToAnother(
  String senderAccountAddress,
  String recieverAccountAddress,
  String senderAccountPin,
  String ammount,
  String gasLimit,
  String gasPrice,
) async {
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
print(response.body);
  return RecievedResponse.fromJson(jsonDecode(response.body));
}
