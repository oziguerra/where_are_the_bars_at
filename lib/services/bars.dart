import 'networking.dart';
import 'location.dart';

const apiKey = 'AIzaSyAHgO-0h3YfsuB7qvNM_3NG8x44f2vW2uA';
const type = 'bar';

class BarsModel {
  Future<dynamic> getLocationBars() async {
    Location location = Location();
    double latitude;
    double longitude;
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String googleMapsURL =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&inputtype=textquery&location=$latitude,$longitude&radius=5000&keyword=bar&type=$type';
    NetworkHelper networkHelper = new NetworkHelper(googleMapsURL);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
