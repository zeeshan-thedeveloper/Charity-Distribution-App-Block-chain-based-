import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getOptionCard(BuildContext context, var item) {
  return SizedBox(
    height: 120,
    width: 150,
    child: Card(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: item["onPressed"],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/${item["image"]}',
                  width: 50,
                  height: 50,
                ),
                Text(item["name"])
              ],
            ),
          )),
    ),
  );
}
