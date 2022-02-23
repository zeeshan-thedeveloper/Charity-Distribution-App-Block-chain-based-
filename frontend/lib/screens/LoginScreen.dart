import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
// Controllers
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(
                            child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  labelText: 'Email',
                                ))),
                      ]),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
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
                                child: Text("Login"),
                              ))
                            ],
                          ))
                    ]))));
  }
}
