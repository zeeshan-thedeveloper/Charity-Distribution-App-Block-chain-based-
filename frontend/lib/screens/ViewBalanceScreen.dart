import 'package:flutter/material.dart';
import 'package:frontend/APICalls/GetBalanceAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';

class ViewBalanceScreen extends StatefulWidget {
  @override
  State<ViewBalanceScreen> createState() => _ViewBalanceScreen();
}

class _ViewBalanceScreen extends State<ViewBalanceScreen> {
  String _userAccountBalance = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  void loadData() async {
    String current_login_user =
        await SharedPreferencedHelper.read(CURRENT_LOGIN_USER);
    if (current_login_user == INDIVIDUAL) {
      LoginResponsePayloadOfUser userLoad = LoginResponsePayloadOfUser.fromJson(
          await SharedPreferencedHelper.read(INDIVIDUAL_DETAILS));

      getBalanceByAccountAddress(userLoad.blockchainAccountAddress)
          .then((response) {
        if (response.responseCode == ACCOUNT_BALANCE_FETCHED) {
          setState(() {
            _userAccountBalance = response.responsePayload;
          });
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, response.responseMessage, "Error"));
        }
      });
    } else {
      print("in else");
      LoginResponsePayloadOfOrganization oganizationLoad =
          LoginResponsePayloadOfOrganization.fromJson(
              await SharedPreferencedHelper.read(ORGANIZATION_DETAILS));

      getBalanceByAccountAddress(oganizationLoad.blockchainAccountAddress)
          .then((response) {
        if (response.responseCode == ACCOUNT_BALANCE_FETCHED) {
          setState(() {
            _userAccountBalance = response.responsePayload;
          });
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, response.responseMessage, "Error"));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balance"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Current balance is : ${_userAccountBalance} ethers",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
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
