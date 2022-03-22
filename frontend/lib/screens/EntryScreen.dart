import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/screens/LoginScreen.dart';
import 'package:frontend/screens/RegistrationOptionsScreen.dart';
import 'package:frontend/screens/SmartContractScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/charity-home-image.jfif',
                fit: BoxFit.cover,
                height: 400,
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text("Login")))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationOptionsScreen()));
                          },
                          child: Text("Register")))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SmartContractScreen()));
                          },
                          child: Text("Smart Contract Demo")))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
