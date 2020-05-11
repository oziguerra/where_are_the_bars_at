import 'package:flutter/material.dart';
import 'package:wherearethebarsat/constants.dart';
import 'package:great_circle_distance2/great_circle_distance2.dart';
import 'package:wherearethebarsat/services/bars.dart';
import 'package:wherearethebarsat/services/location.dart';

class BarsDataModel extends StatelessWidget {
  final String name;
  final int maxImageWidth = 150;

  //TODO: add following variables
  final String photoReference;
  final String placeID;
  var rating;
  var numberOfReviews;
  //final String address;

  BarsDataModel(
      {this.name,
      this.photoReference,
      this.placeID,
      this.rating,
      this.numberOfReviews});

  Future getBarData(String placeID) async {
    var barData = await BarsModel().getDataOfBar(placeID);
    return barData;
  }

  Future<String> calculateDistance() async {
    print('Place ID on datamodel: $placeID');
    final barData = await getBarData(placeID);

    final lat = barData['result']['geometry']['location']['lat'];
    final long = barData['result']['geometry']['location']['lng'];
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    print(lat);
    print(long);
    final gcd = GreatCircleDistance.fromDegrees(
      latitude1: location.latitude,
      longitude1: location.longitude,
      latitude2: lat,
      longitude2: long,
    );

    print('Distance: ${gcd.haversineDistance()}');
    return gcd.haversineDistance().toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('$name card pressed');
        //print('Lat: $lat Long: $long');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
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
              margin: EdgeInsets.symmetric(horizontal: 8.0),
//              height: 100.0,
//              width: 100.0,
              child: Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxImageWidth&key=$apiKey&photoreference=$photoReference'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text('Rating: $rating/5'),
                  Text('Number of reviews: $numberOfReviews'),
                  FutureBuilder<String>(
                    future: calculateDistance(), // a Future<String> or null
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        //case ConnectionState.none: return new Text('Press button to start');
                        case ConnectionState.waiting:
                          return new Text('Calculating distance...');
                        default:
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          else
                            return new Text(
                                'Distance: ${snapshot.data} metres');
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
