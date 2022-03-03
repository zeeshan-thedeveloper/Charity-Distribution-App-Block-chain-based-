import 'package:flutter/material.dart';
import 'package:frontend/APICalls/CreateAccountAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/screens/RegistrationOptionsScreen.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreen();
}

class _UserRegistrationScreen extends State<UserRegistrationScreen> {
  IconData seeOrHidePassword = Icons.visibility_off;
  IconData seeOrHidePin = Icons.visibility_off;
  // controller
  TextEditingController emailControler = new TextEditingController();
  TextEditingController firstNameControler = new TextEditingController();
  TextEditingController lastNameControler = new TextEditingController();
  TextEditingController passwordControler = new TextEditingController();
  TextEditingController pinControler = new TextEditingController();
  TextEditingController phoneNumberControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handlePressedCreateUserAccount() {
      createAccount(
              emailControler.text,
              phoneNumberControler.text,
              passwordControler.text,
              pinControler.text,
              false,
              firstNameControler.text,
              "",
              null,
              "https://avatars.githubusercontent.com/u/66442918?s=400&u=d132ce9df59451343444655464cb44ed8339ab54&v=4",
              false,
              INDIVIDUAL,
              firstNameControler.text,
              lastNameControler.text,
              null)
          .then((response) {
        if (response.responseCode == NEW_ACCOUNT_CREATION_EMAIL_SENT) {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, response.responseMessage, "Info"));
        } else {
          // error
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, response.responseMessage, "Error"));
        }
      });
      // after responce navigate
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text("User"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/user-cover.jfif',
                            fit: BoxFit.cover),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
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
                            Row(children: [
                              Expanded(
                                  child: TextFormField(
                                      maxLength: 13,
                                      controller: phoneNumberControler,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.phone),
                                        labelText: 'phone Number',
                                      ))),
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                        obscureText: true,
                                        maxLength: 6,
                                        controller: passwordControler,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (seeOrHidePassword ==
                                                      Icons.remove_red_eye) {
                                                    seeOrHidePassword =
                                                        Icons.visibility_off;
                                                  } else {
                                                    seeOrHidePassword =
                                                        Icons.remove_red_eye;
                                                  }
                                                });
                                              },
                                              icon: Icon(seeOrHidePassword)),
                                          icon: Icon(Icons.lock),
                                          labelText: 'Password',
                                        ))),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                        obscureText: true,
                                        controller: pinControler,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (seeOrHidePin ==
                                                      Icons.remove_red_eye) {
                                                    seeOrHidePin =
                                                        Icons.visibility_off;
                                                  } else {
                                                    seeOrHidePin =
                                                        Icons.remove_red_eye;
                                                  }
                                                });
                                              },
                                              icon: Icon(seeOrHidePin)),
                                          icon: Icon(Icons.lock),
                                          labelText: 'Pin',
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
                                        handlePressedCreateUserAccount();
                                      },
                                      child: Text("Create Account"),
                                    ))
                                  ],
                                ))
                          ],
                        )
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrationOptionsScreen()));
          },
          child: Text('OK')),
    ],
  );
}
