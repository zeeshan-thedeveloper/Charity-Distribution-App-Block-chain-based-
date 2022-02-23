import 'package:flutter/material.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreen();
}

class _UserRegistrationScreen extends State<UserRegistrationScreen> {
  IconData seeOrHide = Icons.hide_image;
  // controller
  TextEditingController emailControler = new TextEditingController();
  TextEditingController firstNameControler = new TextEditingController();
  TextEditingController lastNameControler = new TextEditingController();
  TextEditingController passwordControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("User"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(
                            child: TextFormField(
                                controller: firstNameControler,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.perm_identity),
                                  labelText: 'First Name',
                                ))),
                      ]),
                      Row(children: [
                        Expanded(
                            child: TextFormField(
                                controller: lastNameControler,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.perm_identity),
                                  labelText: 'Last Name',
                                ))),
                      ]),
                      Row(children: [
                        Expanded(
                            child: TextFormField(
                                controller: emailControler,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  labelText: 'Email',
                                ))),
                      ]),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                  obscureText: true,
                                  controller: passwordControler,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (seeOrHide ==
                                                Icons.remove_red_eye) {
                                              seeOrHide = Icons.hide_image;
                                            } else {
                                              seeOrHide = Icons.remove_red_eye;
                                            }
                                          });
                                        },
                                        icon: Icon(seeOrHide)),
                                    icon: Icon(Icons.lock),
                                    labelText: 'Password',
                                  ))),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Create Account"),
                              ))
                            ],
                          ))
                    ]))));
  }
}
