import 'package:flutter/material.dart';
import 'package:frontend/Components/optionCard.dart';
import 'package:frontend/Components/sideDrawer.dart';
import 'package:frontend/screens/EntryScreen.dart';
import 'package:frontend/screens/ListOfIndividualScreen.dart';
import 'package:frontend/screens/OrganizationProfileScreen.dart';
import 'package:frontend/screens/TransactionsScreen.dart';
import 'package:frontend/screens/ViewBalanceScreen.dart';

import 'OrganizationRequestScreen.dart';

class OrganizationHomeScreen extends StatefulWidget {
  @override
  State<OrganizationHomeScreen> createState() => _OrganizationHomeScreen();
}

class _OrganizationHomeScreen extends State<OrganizationHomeScreen> {
  late List<dynamic> drawerOptions;
  _OrganizationHomeScreen() {
    drawerOptions = [
      {
        "name": "Profile",
        "image": "profile.png",
        "onPressed": () {
          profilePressedHandler();
        }
      },
      // {
      //   "name": "Request",
      //   "image": "post-request.png",
      //   "onPressed": () {
      //     requestsPressedHandler();
      //   }
      // },
      {
        "name": "Transaction history",
        "image": "transaction.png",
        "onPressed": () {
          transactionPressedHandler();
        }
      },
      {
        "name": "Distribute",
        "image": "distribute.png",
        "onPressed": () {
          distributePressedHandler();
        }
      },
      {
        "name": "Balance",
        "image": "amount.png",
        "onPressed": () {
          balancePressedHandler();
        }
      },
      {
        "name": "Signout",
        "image": "sign-out.png",
        "onPressed": () {
          signOutPressedHandler();
        }
      }
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
                        .getRange(4, 5)
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionsScreen()));
  }

  void requestsPressedHandler() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrganizationRequestScreen()));
  }

  void profilePressedHandler() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrganizationProfileScreen()));
  }

  void balancePressedHandler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewBalanceScreen()));
  }

  void signOutPressedHandler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EntryScreen()));
  }

  void distributePressedHandler() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListOfIndividualsScreen()));
  }
}
