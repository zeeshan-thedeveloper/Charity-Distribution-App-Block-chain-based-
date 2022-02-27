import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/modals/Organization.dart';

class OrganizationProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrganizationProfileScreen();
}

class _OrganizationProfileScreen extends State<OrganizationProfileScreen> {
  late Organization current_organization;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current_organization = Organization(
        title: "org title",
        email: "cnjrbvj@gmail.com",
        userUid: "",
        blockchainAccountAddress: "",
        description:
            "heloo heloo heloo heloo heloo heloo heloo heloo heloo heloo heloo  ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.verified_user, size: 35)),
                Row(
                  children: [
                    Text("Title: "),
                    Expanded(child: Text(current_organization.title))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Description: "),
                    Expanded(child: Text(current_organization.description))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Email: "),
                    Expanded(child: Text(current_organization.email))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
