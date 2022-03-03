import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/modals/Transaction.dart';
import 'package:frontend/screens/DonateFundsScreen.dart';
import 'package:http/http.dart';

import '../APICalls/GetSentAndRecievedTransactionsAPICall.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  State<TransactionsScreen> createState() => _TransactionsScreen();
}

class _TransactionsScreen extends State<TransactionsScreen> {
  List<TransactionSent> _sentFundsTransactionList = [];
  List<TransactionRecieved> _recievedFundsTransactionList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //    tabsWidget.add(TabsWidget(_recievedFundsTransactionList, "Recieved"));
    // tabsWidget.add(TabsWidget(_sentFundsTransactionList, "Sent"));
    loadData();
  }

  loadData() async {
    String userAddress;
    String isIndividualOrOrganizationIsLogin =
        await SharedPreferencedHelper.read(CURRENT_LOGIN_USER);
    if (isIndividualOrOrganizationIsLogin == ORGANIZATION) {
      LoginResponsePayloadOfOrganization userLoad =
          LoginResponsePayloadOfOrganization.fromJson(
              await SharedPreferencedHelper.read(ORGANIZATION_DETAILS));

      userAddress = userLoad.blockchainAccountAddress;
    } else {
      LoginResponsePayloadOfUser userLoad = LoginResponsePayloadOfUser.fromJson(
          await SharedPreferencedHelper.read(INDIVIDUAL_DETAILS));
      userAddress = userLoad.blockchainAccountAddress;
    }

    fetchTransactionsList(userAddress);
  }

  fetchTransactionsList(String userAddress) {
    getSentAndRecievedTransactionsListByAccountAddress(userAddress)
        .then((response) {
      if (response.responseCode == SUCESSFUL_TRANSACTIONS_FETCHED) {
        final sentFundsTransactionList = List<dynamic>.from(
            response.responsePayload["sentFundsTransactionList"] as List);
        final recievedFundsTransactionList = List<dynamic>.from(
            response.responsePayload["recievedFundsTransactionList"] as List);
        print("/////////////////////");
        print(response.responsePayload["recievedFundsTransactionList"]);
        sentFundsTransactionList.forEach(((element) {
          final _transaction = TransactionSent.fromJson(
              Map<String, String>.from(element as Map));
          setState(() {
            _sentFundsTransactionList.add(_transaction);
          });
        }));
        print("/////////////////////");
        recievedFundsTransactionList.forEach(((element) {
          final _transaction = TransactionRecieved.fromJson(
              Map<String, String>.from(element as Map));
          setState(() {
            _recievedFundsTransactionList.add(_transaction);
          });
        }));

        //--------------------------------------------------------------

      } else {
        showDialog(
            context: context,
            builder: (context) =>
                gernalDialog(context, response.responseMessage, "Error"));
      }
    });
  }

  final tabs = [
    'Recieved funds',
    'Donated Funds',
  ];

  var tabsWidget = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabsWidget(_recievedFundsTransactionList, "Recieved"),
            TabsWidget(_sentFundsTransactionList, "Sent")
          ],
        ),
      ),
    );
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

Widget TabsWidget(List _transactions, String emptyText) {
  return _transactions.length > 0
      ? ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DonateFundsScreen(
                  //             recieversAddress: _transactions[index]
                  //                 .tranHash)));
                },
                child: Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: ListTile(
                      tileColor: Color.fromARGB(255, 238, 237, 237),
                      isThreeLine: true,
                      title: Text(
                          'Transaction Hash: ${_transactions[index].tranHash}'),
                      subtitle: Text('Amount: ${_transactions[index].ammount}'),
                    )));
          })
      : Center(
          child: Text(emptyText),
        );
}
