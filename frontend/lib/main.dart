import 'package:flutter/material.dart';
import 'package:frontend/screens/EntryScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:frontend/screens/IPScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:frontend/Support/globals.dart' as globals;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return ScopedModel<IPAddressModal>(
        model: IPAddressModal(),
        child: MaterialApp(
          title: 'Charity',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return IPScreen();
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                    child: Text(
                        "Error in initializing firebase ${snapshot.error}"));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}

class IPAddressModal extends Model {
  String _iPAddress = "";

  String get IPAddress => _iPAddress;

  void setIpAddress(String ip) {
    _iPAddress = ip;
    globals.IPADDRESS = _iPAddress;
    notifyListeners();
  }
}
