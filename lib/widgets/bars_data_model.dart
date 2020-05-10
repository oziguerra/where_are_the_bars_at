import 'package:flutter/material.dart';

class BarsDataModel extends StatelessWidget {
  final String name;

  //TODO: add following variables
  //String photoReference;
  //String rating;
  //String userRatings;
  //String address;

  BarsDataModel({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
