import 'package:flutter/material.dart';

class DonateFundsScreen extends StatefulWidget {
  @override
  State<DonateFundsScreen> createState() => _DonateFundsScreen();
}

class _DonateFundsScreen extends State<DonateFundsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate"),
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
              TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.money), label: Text('amount'))),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Donate"))
            ],
          ),
        ),
      ),
    );
  }
}
