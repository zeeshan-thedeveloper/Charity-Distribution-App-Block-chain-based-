import 'dart:convert';

import 'package:frontend/APICalls/FetchedIndividuals.dart';
import 'package:frontend/APICalls/FetechOrganizations.dart';
import 'package:frontend/modals/Account.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';

Future<List<Account>> fetechAllAcccounts() async {
  List<LoginResponsePayloadOfUser> _individualsList = await fetechIndividuals();
  List<LoginResponsePayloadOfOrganization> _organizationList =
      await fetechOrganizations();

  List<Account> _allAccounts = [];
  _individualsList.forEach((element) {
    Account _account = Account(
        accountAddress: element.blockchainAccountAddress,
        userUid: element.userUid);
    _allAccounts.add(_account);
  });
  _organizationList.forEach((element) {
    Account _account = Account(
        accountAddress: element.blockchainAccountAddress,
        userUid: element.userUid);
    _allAccounts.add(_account);
  });
  return _allAccounts;
}
