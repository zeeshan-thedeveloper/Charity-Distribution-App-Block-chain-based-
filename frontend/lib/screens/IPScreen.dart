import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/screens/DonateFundsScreen.dart';
import 'package:frontend/screens/EntryScreen.dart';
import 'package:scoped_model/scoped_model.dart';

class IPScreen extends StatelessWidget {
  TextEditingController ipController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [
            Expanded(
                child: TextFormField(
                    controller: ipController,
                    decoration: InputDecoration(
                      labelText: 'Ip address',
                    ))),
          ]),
          Row(children: [
            Expanded(
              child: ScopedModelDescendant<IPAddressModal>(
                builder: (context, child, model) {
                  return ElevatedButton(
                    onPressed: () {
                      if (ipController.text.length > 0) {
                        model.setIpAddress(ipController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EntryScreen()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => gernalDialog(
                                context, "Please add the ip address", "Error"));
                      }
                    },
                    child: Text('Set IP Address'),
                  );
                },
              ),
            )
          ]),
        ],
      ),
    ));
  }
}

AlertDialog gernalDialog(BuildContext context, String messgae, String title) {
  return AlertDialog(
    title: Text(title),
    content: Text(messgae),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK')),
    ],
  );
}
