import 'package:flutter/material.dart';
import 'package:frontend/APICalls/LoginAPICall.dart';
import 'package:frontend/screens/OrganizationHomeScreen.dart';
import 'package:frontend/screens/UserHomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
// Controllers
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  static String USER = "user", ORGANIZATION = "organization";
  String isUserOrOrganization = USER; // by default user

  @override
  Widget build(BuildContext context) {
    void handleLoginPressed() {
      if (isUserOrOrganization == USER) {
        authenticateUser(emailController.text, passwordController.text,
            isUserOrOrganization);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserHomeScreen()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrganizationHomeScreen()));
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Login"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/register-cover.jpg",
                            fit: BoxFit.cover),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
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
                                        onPressed: () {
                                          handleLoginPressed();
                                        },
                                        child: Text("Login"),
                                      ))
                                    ],
                                  ))
                            ]),
                      ]))),
        ));
  }
}
