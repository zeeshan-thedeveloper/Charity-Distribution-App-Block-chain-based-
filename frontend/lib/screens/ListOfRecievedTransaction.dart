import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/APICalls/GetSentAndRecievedTransactionsAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/Transaction.dart';

class ListOfRecievedTransactions extends StatefulWidget {
  String address;
  ListOfRecievedTransactions({Key? key, required this.address})
      : super(key: key);
  @override
  State<ListOfRecievedTransactions> createState() =>
      _ListOfRecievedTransactions();
}

class _ListOfRecievedTransactions extends State<ListOfRecievedTransactions> {
  List<TransactionRecieved> _recievedFundsTransactionList = [];
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
        final recievedFundsTransactionList = List<dynamic>.from(
            response.responsePayload["recievedFundsTransactionList"] as List);

        recievedFundsTransactionList.forEach(((element) {
          final _transaction = TransactionRecieved.fromJson(
              Map<String, String>.from(element as Map));
          setState(() {
            _recievedFundsTransactionList.add(_transaction);
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
          title: Text("User Recieved funds"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: _recievedFundsTransactionList.length > 0
            ? ListView.builder(
                itemCount: _recievedFundsTransactionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 238, 237, 237),
                        isThreeLine: true,
                        title: Text(
                            '${_recievedFundsTransactionList[index].tranHash}'),
                        subtitle: Text(
                            'Amount: ${_recievedFundsTransactionList[index].ammount}'),
                      ));
                })
            : Center(
                child: Text("Funds Recieved By User"),
              ));
  }
}
