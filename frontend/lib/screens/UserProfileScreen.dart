import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/modals/LoginResponse.dart';
import 'package:frontend/modals/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileSCreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileSCreen> {
  LoginResponsePayloadOfUser current_user = LoginResponsePayloadOfUser();

  TextStyle textStyle = TextStyle(fontSize: 18);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    LoginResponsePayloadOfUser userLoad = LoginResponsePayloadOfUser.fromJson(
        await SharedPreferencedHelper.read(USER_DETAILS));
    setState(() {
      current_user = userLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Profile",
          ),
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
                    icon: Icon(Icons.perm_identity, size: 55)),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "First Name: ",
                      style: textStyle,
                    ),
                    Expanded(
                        child: Text(current_user.firstName, style: textStyle))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Last Name: ", style: textStyle),
                    Expanded(
                        child: Text(current_user.lastName, style: textStyle))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email: ", style: textStyle),
                    Expanded(child: Text(current_user.email, style: textStyle))
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
