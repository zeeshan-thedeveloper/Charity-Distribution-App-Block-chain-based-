import 'package:flutter/material.dart';

DisplayContractDetails(BuildContext context, var ContractDetail) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 1000),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Scaffold(
        appBar: AppBar(
            title: Text("Contract Details"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close))),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "Block Hash",
              ),
              Text(
                ' ${ContractDetail['contractFullDetails']['blockHash']}',
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
              ),
              SizedBox(height: 10),
              Text(
                "Block Number",
              ),
              Text(
                ' ${ContractDetail['contractFullDetails']['blockNumber']}',
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
              ),
              SizedBox(height: 10),
              Text(
                "contract Address ",
              ),
              Text(
                '${ContractDetail['contractFullDetails']['contractAddress']}',
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
              ),
              SizedBox(height: 10),
              Text(
                "from ",
              ),
              Text(
                '${ContractDetail['contractFullDetails']['from']}',
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
              ),
              SizedBox(height: 10),
              Text(
                "Transaction Hash",
              ),
              Text(
                '${ContractDetail['contractFullDetails']['transactionHash']}',
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 10),
              Divider(
                height: 5,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
