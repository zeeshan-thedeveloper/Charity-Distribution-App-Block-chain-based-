import 'package:flutter/material.dart';
import 'package:frontend/APICalls/SendAmountAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/Support/SharedPreferencedHelper.dart';
import 'package:frontend/modals/LoginResponsePayload.dart';

class DonateFundsScreen extends StatefulWidget {
  String recieversAddress;
  DonateFundsScreen({Key? key, required this.recieversAddress})
      : super(key: key);
  @override
  State<DonateFundsScreen> createState() => _DonateFundsScreen();
}

class _DonateFundsScreen extends State<DonateFundsScreen> {
  String senderAddress = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    String isIndividualOrOrganizationIsLogin =
        await SharedPreferencedHelper.read(CURRENT_LOGIN_USER);
    if (isIndividualOrOrganizationIsLogin == ORGANIZATION) {
      LoginResponsePayloadOfOrganization userLoad =
          LoginResponsePayloadOfOrganization.fromJson(
              await SharedPreferencedHelper.read(ORGANIZATION_DETAILS));

      setState(() {
        print("in org set state");
        senderAddress = userLoad.blockchainAccountAddress;
      });
    } else if (isIndividualOrOrganizationIsLogin == INDIVIDUAL) {
      LoginResponsePayloadOfUser userLoad = LoginResponsePayloadOfUser.fromJson(
          await SharedPreferencedHelper.read(INDIVIDUAL_DETAILS));

      setState(() {
        print("in ind set state");
        senderAddress = userLoad.blockchainAccountAddress;
      });
    }
  }

  TextEditingController pinControler = new TextEditingController();
  TextEditingController amountControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void donatePressHandler() {
      if (pinControler.text.length > 0 && amountControler.text.length > 0) {
        if (double.parse(amountControler.text) > 0.0) {
          print(senderAddress);
          print('***********************');
          print(widget.recieversAddress);

          sendAmountFromOneAccountToAnother(
                  senderAddress,
                  widget.recieversAddress,
                  pinControler.text,
                  amountControler.text,
                  "21000",
                  "10")
              .then((response) {
            print(response.responseCode);
            print(SUCESSFUL_TRANSACTION);
            if (response.responseCode == SUCESSFUL_TRANSACTION) {
              showDialog(
                  context: context,
                  builder: (context) => gernalDialog(
                      context, "Transaction is sucessfull", "Info"));
            } else {
              showDialog(
                  context: context,
                  builder: (context) =>
                      gernalDialog(context, response.responseMessage, "Error"));
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, "Amount should be positive", "Error"));
        }
      } else {
        showDialog(
            context: context,
            builder: (context) =>
                gernalDialog(context, "Please fill all fields", "Error"));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Donate"),
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
              TextFormField(
                  controller: amountControler,
                  decoration: InputDecoration(
                      icon: Icon(Icons.money), label: Text('amount'))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: pinControler,
                  decoration: InputDecoration(
                      icon: Icon(Icons.money), label: Text('Pin'))),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    donatePressHandler();
                  },
                  child: Text("Donate"))
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
