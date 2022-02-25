import 'package:flutter/material.dart';

class ViewBalanceScreen extends StatefulWidget {
  @override
  State<ViewBalanceScreen> createState() => _ViewBalanceScreen();
}

class _ViewBalanceScreen extends State<ViewBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balance"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Current balance is : 120 ethers",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
