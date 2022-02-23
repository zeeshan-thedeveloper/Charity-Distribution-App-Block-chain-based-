import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTransactionsScreen extends StatefulWidget {
  @override
  State<UserTransactionsScreen> createState() => _UserTransactionsScreen();
}

class _UserTransactionsScreen extends State<UserTransactionsScreen> {
  final tabs = [
    'Recieved funds',
    'Donated Funds',
  ];
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
            for (final tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
