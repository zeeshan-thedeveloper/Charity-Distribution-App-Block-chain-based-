import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Organization"),
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
                                controller: nameController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.perm_identity),
                                  labelText: 'Name',
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
                            items: countries
                                .map<DropdownMenuItem<String>>((String value) {
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
                        height: 40,
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
                                onPressed: () {},
                                child: Text("Create Account"),
                              ))
                            ],
                          ))
                    ]))));
  }
}
