import 'networking.dart';
import 'location.dart';
import 'package:wherearethebarsat/constants.dart';

const type = 'bar';

class BarsModel {
  Future<dynamic> getLocationBars() async {
    Location location = Location();
    double latitude;
    double longitude;
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    //Using rank by distance
    String googleMapsURL =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&inputtype=textquery&location=$latitude,$longitude&rankby=distance&type=bar";
    //Using radius
//    String googleMapsURL =
//        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&inputtype=textquery&location=$latitude,$longitude&radius=5000&keyword=bar&type=$type';
    NetworkHelper networkHelper = new NetworkHelper(googleMapsURL);

    var barData = await networkHelper.getData();

    return barData;
  }
}
