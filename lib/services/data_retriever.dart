import 'networking.dart';
import 'location.dart';
import 'package:wherearethebarsat/constants.dart';

const type = 'bar';

/*
 * Class used to retrieve data for closest bars and each bar
 */
class BarsModel {
  //Gets the list of closest bars
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

    print(googleMapsURL);
    //Using radius
//    String googleMapsURL =
//        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&inputtype=textquery&location=$latitude,$longitude&radius=5000&keyword=bar&type=$type';
    NetworkHelper networkHelper = new NetworkHelper(googleMapsURL);

    var barData = await networkHelper.getData();

    return barData;
  }

  //Gets the information of a specific place (in this case a specific bar)
  Future<dynamic> getDataOfBar(String placeID) async {
    //Using rank by distance
    print('Place ID: $placeID');
    String googlePlaceURL =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=name,geometry,rating,formatted_phone_number&key=$apiKey';
    NetworkHelper networkHelper = new NetworkHelper(googlePlaceURL);

    var barData = await networkHelper.getData();

    return barData;
  }
}
