import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/APICalls/GetSentAndRecievedTransactionsAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/Transaction.dart';

class ListOfSentTransactions extends StatefulWidget {
  String address;
  ListOfSentTransactions({Key? key, required this.address}) : super(key: key);
  @override
  State<ListOfSentTransactions> createState() => _ListOfSentTransactions();
}

class _ListOfSentTransactions extends State<ListOfSentTransactions> {
  List<TransactionSent> _sentFundsTransactionList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTransactionsList(widget.address);
  }

  fetchTransactionsList(String userAddress) {
    getSentAndRecievedTransactionsListByAccountAddress(userAddress)
        .then((response) {
      if (response.responseCode == SUCESSFUL_TRANSACTIONS_FETCHED) {
        final sentFundsTransactionList = List<dynamic>.from(
            response.responsePayload["sentFundsTransactionList"] as List);

        sentFundsTransactionList.forEach(((element) {
          final _transaction = TransactionSent.fromJson(
              Map<String, String>.from(element as Map));
          setState(() {
            _sentFundsTransactionList.add(_transaction);
          });
        }));

        //--------------------------------------------------------------

      } else {
        // showDialog(
        //     context: context,
        //     builder: (context) =>
        //         gernalDialog(context, response.responseMessage, "Error"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Organization Donated funds"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _sentFundsTransactionList.length > 0
            ? ListView.builder(
                itemCount: _sentFundsTransactionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 238, 237, 237),
                        isThreeLine: true,
                        title: Text(
                            '${_sentFundsTransactionList[index].tranHash}'),
                        subtitle: Text(
                            'Amount: ${_sentFundsTransactionList[index].ammount}'),
                      ));
                })
            : Center(
                child: Text("Transactions By organization"),
              ));
  }
}
