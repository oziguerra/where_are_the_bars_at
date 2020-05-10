import 'package:flutter/material.dart';
import 'package:wherearethebarsat/constants.dart';

class BarsDataModel extends StatelessWidget {
  final String name;
  final int maxImageWidth = 100;

  //TODO: add following variables
  final String photoReference;
  //final String rating;
  //final String userRatings;
  //final String address;

  BarsDataModel({this.name, this.photoReference});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('$name card pressed');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        height: 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
//              color: Colors.green,
//              margin: EdgeInsets.symmetric(horizontal: 5.0),
//              height: 100.0,
//              width: 100.0,
              child: Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&key=$apiKey&photoreference=$photoReference'),
            ),
            Column(
              children: <Widget>[
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
