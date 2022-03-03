import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<LoginResponsePayloadOfUser>> fetechIndividuals() async {
  List<LoginResponsePayloadOfUser> _individualsList = [];
  DatabaseReference firebaseRef =
      FirebaseDatabase.instance.ref().child(INDIVIDUAL_COLLECTION);

  return firebaseRef.once().then((value) {
    Map maped = value.snapshot.value as Map;

    maped.forEach((key, val) {
      print(val);
      LoginResponsePayloadOfUser _individual = LoginResponsePayloadOfUser(
        blockchainAccountAddress: val["blockchainAccountAddress"],
        email: val["email"],
        firstName: val["firstName"],
        lastName: val["lastName"],
        userUid: val["userUid"],
      );
      _individualsList.add(_individual);
    });
    return _individualsList;
  });
}
