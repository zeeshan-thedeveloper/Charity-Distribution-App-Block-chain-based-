import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/DonateFundsScreen.dart';

class ListOfOrganizationsScreen extends StatefulWidget {
  @override
  State<ListOfOrganizationsScreen> createState() =>
      _ListOfOrganizationsScreen();
}

class _ListOfOrganizationsScreen extends State<ListOfOrganizationsScreen> {
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
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DonateFundsScreen()));
            },
            child: ListTile(
              title: Text('Organization no. ${index + 1}'),
            ));
      }),
    );
  }
}
