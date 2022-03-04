import 'package:flutter/material.dart';
import 'package:frontend/APICalls/DeployContractAPICall.dart';
import 'package:frontend/APICalls/FetchAllAccounts.dart';
import 'package:frontend/APICalls/GetDataFromBlockChainAPICall.dart';
import 'package:frontend/APICalls/StoreDataOnBlockChainAPICall.dart';
import 'package:frontend/Support/Constants.dart';
import 'package:frontend/modals/Account.dart';
import 'package:frontend/Components/ContractDetails.dart';

class SmartContractScreen extends StatefulWidget {
  State<SmartContractScreen> createState() => _SmartContractScreen();
}

class _SmartContractScreen extends State<SmartContractScreen> {
  late Account _selectedAccountForDeployContract,
      _selectedAccountForSettingData;
  String _returnedData = "", _contractAddress = "";
  // controllers
  TextEditingController textDataController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  TextEditingController indexController = new TextEditingController();

  TextEditingController pinForSettingDataController =
      new TextEditingController();

  List<Account> _accounts = [];
  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    loadData();
  }

  loadData() async {
    List<Account> fetchedaccounts = await fetechAllAcccounts();
    setState(() {
      _accounts = fetchedaccounts;
      _selectedAccountForDeployContract = _accounts[0];
      _selectedAccountForSettingData = _accounts[0];
    });
  }

  deployContractPressedHandler() async {
    deployContract(
      _selectedAccountForDeployContract.accountAddress,
      pinController.text,
      _selectedAccountForDeployContract.userUid,
    ).then((response) {
      if (response.responseCode == CONTRACT_DEPLOYED_SUCCESSFULLY) {
        setState(() {
          _contractAddress =
              response.responsePayload["contractAddress"].toString();
        });
        DisplayContractDetails(context, response.responsePayload);
      } else {
        showDialog(
            context: context,
            builder: (conrext) =>
                gernalDialog(context, response.responseMessage, "Error"));
      }
    });
  }

  setDatainContractPressHanlder() async {
    if (_selectedAccountForDeployContract == _selectedAccountForSettingData) {
      storeDataOnBlockChain(
        textDataController.text,
        _selectedAccountForSettingData.accountAddress,
        _contractAddress,
        pinForSettingDataController.text,
      ).then((response) {
        if (response.responseCode == CONTRACT_DATA_SET_ON_BLOCKCHAIN) {
          showDialog(
              context: context,
              builder: (context) =>
                  gernalDialog(context, "Data setted successfully", "Info"));
        } else {
          showDialog(
              context: context,
              builder: (context) => gernalDialog(
                  context, response.responseMessage.toString(), "Error"));
        }
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => gernalDialog(
              context,
              "deployed account address does not match with selected address for seeting data",
              "Error"));
    }
  }

  getDataPressHanlder() async {
    getDataFromBlockChain(
            indexController.text,
            pinForSettingDataController.text,
            _selectedAccountForSettingData.accountAddress,
            _contractAddress)
        .then((response) {
      if (response.responseCode == CONTRACT_DATA_GET_FROM_BLOCKCHAIN) {
        setState(() {
          _returnedData = response.responsePayload.toString();
        });
      } else {
        showDialog(
            context: context,
            builder: (context) => gernalDialog(
                context, response.responseMessage.toString(), "Error"));
      }
      print(response.responsePayload.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Smart Contract Demo"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: _accounts.length > 0
            ? SingleChildScrollView(
                child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Select account to deploy contract",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 32,
                            elevation: 16,
                            isExpanded: true,
                            value: _selectedAccountForDeployContract,
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            items: _accounts.map<DropdownMenuItem<Account>>(
                                (Account value) {
                              return DropdownMenuItem<Account>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    value.accountAddress,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (Account? newAccount) {
                              setState(() {
                                _selectedAccountForDeployContract = newAccount!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: pinController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Pin",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  deployContractPressedHandler();
                                },
                                child: Text("Deploy")))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 5,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text("Select account to set data in contract",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 32,
                            elevation: 16,
                            isExpanded: true,
                            value: _selectedAccountForSettingData,
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            items: _accounts.map<DropdownMenuItem<Account>>(
                                (Account value) {
                              return DropdownMenuItem<Account>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    value.accountAddress,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (Account? newAccount) {
                              setState(() {
                                _selectedAccountForSettingData = newAccount!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: textDataController,
                      decoration: InputDecoration(
                        hintText: "Type Data here..",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: pinForSettingDataController,
                      decoration: InputDecoration(
                        hintText: "Type Pin here..",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  setDatainContractPressHanlder();
                                },
                                child: Text("Set")))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 5,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: indexController,
                      decoration: InputDecoration(
                        hintText: "Type index here..",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _returnedData,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  getDataPressHanlder();
                                },
                                child: Text("Get")))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ))
            : Center(
                child: CircularProgressIndicator(),
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
          },
          child: Text('OK')),
    ],
  );
}
