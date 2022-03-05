import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/APICalls/FetchedIndividuals.dart';
import 'package:frontend/APICalls/FetechOrganizations.dart';
import 'package:frontend/APICalls/GetNeedyAccountsAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/screens/DonateFundsScreen.dart';
import 'package:frontend/screens/ListOfRecievedTransaction.dart';

class ListOfIndividualsScreen extends StatefulWidget {
  State<ListOfIndividualsScreen> createState() => _ListOfIndividualsScreen();
}

class _ListOfIndividualsScreen extends State<ListOfIndividualsScreen> {
  List<LoginResponsePayloadOfUser> _individualList = [];
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadOrganizations();
  }

  Future<void> loadOrganizations() async {
    // List<LoginResponsePayloadOfUser> _individualFetechedList =
    //     await fetechIndividuals();

    List<LoginResponsePayloadOfUser> _individualsList = [];
    getNeedyAccounts().then((response) {
      if (response.responseCode == SUCCESSFULL_FETCHED_NEEDY_ACCOUNTS) {
        print(response.responsePayload);
        for (var item in response.responsePayload) {
          LoginResponsePayloadOfUser _individual = LoginResponsePayloadOfUser(
              blockchainAccountAddress: item["blockchainAccountAddress"],
              email: item["email"],
              firstName: item["firstName"],
              lastName: item["lastName"],
              userUid: item["userUid"],
              accountCatagory: item['accountCatagory']);
          _individualsList.add(_individual);
        }
        setState(() {
          print('in set state');
          _individualList = _individualsList;
        });
      } else {
        showDialog(
            context: context,
            builder: (context) =>
                gernalDialog(context, response.responseMessage, "Error"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select User"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _individualList.length > 0
            ? ListView.builder(
                itemCount: _individualList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonateFundsScreen(
                                    recieversAddress: _individualList[index]
                                        .blockchainAccountAddress)));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: ListTile(
                          leading: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListOfRecievedTransactions(
                                                address: _individualList[index]
                                                    .blockchainAccountAddress)));
                              },
                              icon: Icon(Icons.open_in_new)),
                          tileColor: Color.fromARGB(255, 238, 237, 237),
                          isThreeLine: true,
                          title: Text(
                              '${_individualList[index].firstName} ${_individualList[index].lastName} '),
                          subtitle: Text(
                              '${_individualList[index].blockchainAccountAddress} '),
                        ),
                      ));
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

AlertDialog gernalDialog(BuildContext context, String messgae, String title) {
  return AlertDialog(
    title: Text(title),
    content: Text(messgae),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK')),
    ],
  );
}
