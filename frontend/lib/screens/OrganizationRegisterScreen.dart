import 'package:flutter/material.dart';
import 'package:frontend/APICalls/CreateAccountAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/screens/LoginScreen.dart';
import 'package:http/http.dart';

class OrganizationRegistrationScreen extends StatefulWidget {
  @override
  State<OrganizationRegistrationScreen> createState() =>
      _OrganizationRegistrationScreen();
}

class _OrganizationRegistrationScreen
    extends State<OrganizationRegistrationScreen> {
  // variables
  List<String> cities = ["Sukkur", "karachi", "Ghotki"];
  List<String> countries = ["pakistan", "Uk", "Germany"];
  late String selectedCity = cities[0];
  late String selecteCountry = countries[0];
  bool isTermsAccepted = false;

  // controllers
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleOrganizationCreateAccoundPressed() {
      createAccount(
              emailController.text,
              phoneNumberController.text,
              passwordController.text,
              pinController.text,
              false,
              nameController.text,
              selecteCountry + ":" + selectedCity,
              null,
              "https://avatars.githubusercontent.com/u/66442918?s=400&u=d132ce9df59451343444655464cb44ed8339ab54&v=4",
              false,
              ORGANIZATION,
              "",
              "",
              descriptionController.text,
              "")
          .then((response) {
        if (response.responseCode == SUCCESSFULL_LOGIN) {
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, response.responseMessage, "Error"));
        }
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text("Organization"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/register-cover-photo.jfif',
                            fit: BoxFit.cover),
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
                        Row(children: [
                          Expanded(
                              child: TextFormField(
                                  maxLength: 13,
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.phone),
                                    labelText: 'Phone number',
                                  ))),
                        ]),
                        SizedBox(
                          height: 40,
                        ),
                        Row(children: [
                          Expanded(
                              child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.perm_identity),
                                    labelText: 'Title',
                                  ))),
                        ]),
                        Row(children: [
                          Expanded(
                              child: TextFormField(
                                  maxLines: 4,
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.perm_identity),
                                    labelText: 'Description',
                                  ))),
                        ]),
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                    maxLength: 6,
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: 'Password',
                                    ))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                    controller: pinController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: 'Pin',
                                    ))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton(
                                icon: Icon(Icons.location_city),
                                value: selectedCity,
                                items: cities.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newCity) {
                                  setState(() {
                                    selectedCity = newCity!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: DropdownButton(
                              icon: Icon(Icons.map),
                              value: selecteCountry,
                              items: countries.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newCountry) {
                                setState(() {
                                  selecteCountry = newCountry!;
                                });
                              },
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: isTermsAccepted,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isTermsAccepted = val!;
                                  });
                                }),

                            Text(
                              'Accept Terms and condition',
                              style: TextStyle(fontSize: 17.0),
                            ), //Text
                          ], //<Widget>[]
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: OutlinedButton(
                                  onPressed: () {
                                    handleOrganizationCreateAccoundPressed();
                                  },
                                  child: Text("Create Account"),
                                ))
                              ],
                            ))
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text('OK')),
    ],
  );
}
