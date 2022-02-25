import 'package:flutter/material.dart';

class PostRequestScreen extends StatefulWidget {
  @override
  State<PostRequestScreen> createState() => _PostRequestScreen();
}

class _PostRequestScreen extends State<PostRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post request"),
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
              TextFormField(decoration: InputDecoration(label: Text('Title'))),
              SizedBox(
                height: 10,
              ),
              TextFormField(decoration: InputDecoration(label: Text('amount'))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(label: Text('Description'))),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Post")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
