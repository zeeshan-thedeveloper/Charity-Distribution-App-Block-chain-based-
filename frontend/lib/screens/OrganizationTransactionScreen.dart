import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrganizationTransactionScreen extends StatefulWidget {
  @override
  State<OrganizationTransactionScreen> createState() =>
      _OrganizationTransactionScreen();
}

class _OrganizationTransactionScreen
    extends State<OrganizationTransactionScreen> {
  final tabs = [
    'Recieved donation',
    'Distributed donations',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Requests'),
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
