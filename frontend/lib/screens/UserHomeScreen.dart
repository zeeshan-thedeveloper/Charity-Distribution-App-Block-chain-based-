import 'package:flutter/material.dart';
import 'package:frontend/Components/optionCard.dart';
import 'package:frontend/Components/sideDrawer.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';
import 'package:frontend/screens/EntryScreen.dart';
import 'package:frontend/screens/ListOfOrganizationsScreen.dart';
import 'package:frontend/screens/PostRequestScreen.dart';
import 'package:frontend/screens/UserProfileScreen.dart';
import 'package:frontend/screens/TransactionsScreen.dart';
import 'package:frontend/screens/ViewBalanceScreen.dart';

class UserHomeScreen extends StatefulWidget {
  String isNeedyOrDonator;
  UserHomeScreen({Key? key, required this.isNeedyOrDonator}) : super(key: key);
  @override
  State<UserHomeScreen> createState() => _UserHomeScreen();
}

class _UserHomeScreen extends State<UserHomeScreen> {
  late List<dynamic> drawerOptions;
  int isNeedy = 3;
  _UserHomeScreen() {
    drawerOptions = [
      {
        "name": "Profile",
        "image": "profile.png",
        "onPressed": () {
          profilePreessedHandler();
        }
      },
      // {
      //   "name": "Post request",
      //   "image": "post-request.png",
      //   "onPressed": () {
      //     postRequestPreessedHandler();
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
      {
        "name": "Signout",
        "image": "sign-out.png",
        "onPressed": () {
          logoutPreessedHandler();
        }
      }
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// check for needy or donater
    loadData();
  }

  loadData() async {
    setState(() {
      if (widget.isNeedyOrDonator == DONATOR) {
        isNeedy = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.dashboard),
        title: Text("Dashboard"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.dashboard)),
      ),
      // drawer: getDrawer(context),
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
                        .getRange(isNeedy, 4)
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

  void profilePreessedHandler() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserProfileSCreen()));
  }

  void logoutPreessedHandler() {
    // clear data
    SharedPreferencedHelper.clearAll();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EntryScreen()));
  }
}
