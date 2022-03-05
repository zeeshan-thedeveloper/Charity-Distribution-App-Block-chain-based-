import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/APICalls/LoginAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/modals/RecievedResponse.dart';
import 'package:frontend/screens/OrganizationHomeScreen.dart';
import 'package:frontend/screens/UserHomeScreen.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/screens/UserRegisterationScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
// Controllers
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String isUserOrOrganization = INDIVIDUAL; // by default user
  Future<RecievedResponse>? _futureLoginResponse;

  @override
  Widget build(BuildContext context) {
    /// method which will be called when user clikc on login button
    void handleLoginPressed() {
      if (isUserOrOrganization == INDIVIDUAL) {
        authenticateUser(emailController.text, passwordController.text,
                isUserOrOrganization)
            .then((value) {
          // print('response code ${value.responseCode}');
          // print(SUCCESSFULL_LOGIN);R
          if (value.responseCode == SUCCESSFULL_LOGIN) {
            LoginResponsePayloadOfUser loginResponsePayload =
                LoginResponsePayloadOfUser(
                    blockchainAccountAddress:
                        value.responsePayload["blockchainAccountAddress"],
                    email: value.responsePayload["email"],
                    firstName: value.responsePayload["firstName"],
                    lastName: value.responsePayload["lastName"],
                    userUid: value.responsePayload["userUid"],
                    accountCatagory: value.responsePayload["accountCatagory"]);

            SharedPreferencedHelper.save(
                INDIVIDUAL_DETAILS, loginResponsePayload);
            SharedPreferencedHelper.save(
                CURRENT_LOGIN_USER, isUserOrOrganization);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserHomeScreen(
                        isNeedyOrDonator:
                            value.responsePayload["accountCatagory"])));
          } else {
            showDialog(
                context: context,
                builder: (context) =>
                    gernalDialog(context, value.responseMessage, "Error"));
          }
          // create a user payload object to save it in shared preference
        });
      } else if (isUserOrOrganization == ORGANIZATION) {
        authenticateUser(emailController.text, passwordController.text,
                isUserOrOrganization)
            .then((value) {
          if (value.responseCode == SUCCESSFULL_LOGIN) {
            LoginResponsePayloadOfOrganization
                _loginResponsePayloadOfOrganization =
                LoginResponsePayloadOfOrganization(
              blockchainAccountAddress:
                  value.responsePayload["blockchainAccountAddress"],
              email: value.responsePayload["email"],
              title: value.responsePayload["title"],
              description: value.responsePayload["description"],
              userUid: value.responsePayload["userUid"],
            );
            SharedPreferencedHelper.save(
                ORGANIZATION_DETAILS, _loginResponsePayloadOfOrganization);
            SharedPreferencedHelper.save(
                CURRENT_LOGIN_USER, isUserOrOrganization);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrganizationHomeScreen()));
          } else {
            showDialog(
                context: context,
                builder: (context) =>
                    gernalDialog(context, value.responseMessage, "Error"));
          }
        });
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
                              ListTile(
                                title: Text(INDIVIDUAL),
                                leading: Radio(
                                  value: INDIVIDUAL,
                                  groupValue: isUserOrOrganization,
                                  onChanged: (String? value) {
                                    setState(() {
                                      isUserOrOrganization = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(ORGANIZATION),
                                leading: Radio(
                                  value: ORGANIZATION,
                                  groupValue: isUserOrOrganization,
                                  onChanged: (String? value) {
                                    setState(() {
                                      isUserOrOrganization = value!;
                                    });
                                  },
                                ),
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
