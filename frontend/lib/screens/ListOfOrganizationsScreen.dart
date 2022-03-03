import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/APICalls/FetechOrganizations.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/screens/DonateFundsScreen.dart';
import 'package:frontend/screens/ListOfSentTransactions.dart';

class ListOfOrganizationsScreen extends StatefulWidget {
  State<ListOfOrganizationsScreen> createState() =>
      _ListOfOrganizationsScreen();
}

class _ListOfOrganizationsScreen extends State<ListOfOrganizationsScreen> {
  List<LoginResponsePayloadOfOrganization> _organizationList = [];
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadOrganizations();
  }

  Future<void> loadOrganizations() async {
    List<LoginResponsePayloadOfOrganization> _organizationFetechedList =
        await fetechOrganizations();

    setState(() {
      print('in set state');
      _organizationList = _organizationFetechedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Organization"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _organizationList.length > 0
            ? ListView.builder(
                itemCount: _organizationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonateFundsScreen(
                                    recieversAddress: _organizationList[index]
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
                                              ListOfSentTransactions(
                                                  address: _organizationList[
                                                          index]
                                                      .blockchainAccountAddress)));
                                },
                                icon: Icon(Icons.open_in_new)),
                            tileColor: Color.fromARGB(255, 238, 237, 237),
                            isThreeLine: true,
                            title: Text('${_organizationList[index].title}'),
                            subtitle: Text(
                                '${_organizationList[index].blockchainAccountAddress}'),
                          )));
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
