import 'dart:convert';

import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<LoginResponsePayloadOfOrganization>> fetechOrganizations() async {
  List<LoginResponsePayloadOfOrganization> _organizationList = [];
  DatabaseReference firebaseRef =
      FirebaseDatabase.instance.ref().child(ORGANIZATION_COLLECTION);

  return firebaseRef.once().then((value) {
    //print(value.snapshot.value);
    Map maped = value.snapshot.value as Map;

    maped.forEach((key, val) {
      LoginResponsePayloadOfOrganization _organization =
          LoginResponsePayloadOfOrganization(
        blockchainAccountAddress: val["blockchainAccountAddress"],
        email: val["email"],
        title: val["title"],
        description: val["description"],
        userUid: val["userUid"],
      );
      _organizationList.add(_organization);
    });
    return _organizationList;
  });
}
