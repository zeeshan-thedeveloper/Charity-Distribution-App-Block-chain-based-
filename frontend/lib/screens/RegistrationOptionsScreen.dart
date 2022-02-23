import 'dart:core';

import 'package:flutter/material.dart';
import 'package:frontend/screens/OrganizationRegisterScreen.dart';
import 'package:frontend/screens/UserRegisterationScreen.dart';

class RegistrationOptionsScreen extends StatefulWidget {
  @override
  State<RegistrationOptionsScreen> createState() =>
      _RegistrationOptionsScreen();
}

class _RegistrationOptionsScreen extends State<RegistrationOptionsScreen> {
  final List<String> options = ["Individual", "Organization"];
  late String selecteOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registeration"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Text(
                "Select whether you want to register as an individual or as a organization",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          ),
          Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: DropdownButton(
                          elevation: 16,
                          value: selecteOption,
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selecteOption = newValue!;
                            });
                          }))
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          if (selecteOption == options[0]) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserRegistrationScreen()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrganizationRegistrationScreen()));
                          }
                        },
                        child: Text("Next"))),
              ]))
        ],
      ),
    );
  }
}
