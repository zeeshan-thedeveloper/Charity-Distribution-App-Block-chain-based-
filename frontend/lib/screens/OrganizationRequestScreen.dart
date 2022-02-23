import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrganizationRequestScreen extends StatefulWidget {
  @override
  State<OrganizationRequestScreen> createState() =>
      _OrganizationRequestScreen();
}

class _OrganizationRequestScreen extends State<OrganizationRequestScreen> {
  final tabs = [
    'New',
    'Pending',
    'Resolved',
    'Cancenled',
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
