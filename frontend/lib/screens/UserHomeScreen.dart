import 'package:flutter/material.dart';
import 'package:frontend/Components/optionCard.dart';
import 'package:frontend/Components/sideDrawer.dart';
import 'package:frontend/screens/ListOfOrganizationsScreen.dart';
import 'package:frontend/screens/PostRequestScreen.dart';
import 'package:frontend/screens/UserTransactionsScreen.dart';
import 'package:frontend/screens/ViewBalanceScreen.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  State<UserHomeScreen> createState() => _UserHomeScreen();
}

class _UserHomeScreen extends State<UserHomeScreen> {
  late List<dynamic> drawerOptions;
  _UserHomeScreen() {
    drawerOptions = [
      {"name": "Profile", "image": "profile.png", "onPressed": () {}},
      {
        "name": "Post request",
        "image": "post-request.png",
        "onPressed": () {
          postRequestPreessedHandler();
        }
      },
      {
        "name": "Transaction history",
        "image": "transaction.png",
        "onPressed": () {
          transactionPressedHandler();
        }
      },
      {
        "name": "Donate",
        "image": "transfer.png",
        "onPressed": () {
          donatePreessedHandler();
        }
      },
      {
        "name": "Balance",
        "image": "amount.png",
        "onPressed": () {
          balancePreessedHandler();
        }
      },
      {"name": "Signout", "image": "sign-out.png", "onPressed": () {}}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.dashboard),
        title: Text("Dashboard"),
      ),
      drawer: getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: drawerOptions
                        .getRange(0, 2)
                        .map((item) => getOptionCard(context, item))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: drawerOptions
                        .getRange(2, 4)
                        .map((item) => getOptionCard(context, item))
                        .toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: drawerOptions
                        .getRange(4, 6)
                        .map((item) => getOptionCard(context, item))
                        .toList(),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void transactionPressedHandler() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UserTransactionsScreen()));
  }

  void donatePreessedHandler() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListOfOrganizationsScreen()));
  }

  void postRequestPreessedHandler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostRequestScreen()));
  }

  void balancePreessedHandler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewBalanceScreen()));
  }
}
