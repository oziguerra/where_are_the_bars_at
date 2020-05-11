import 'package:flutter/material.dart';
import 'package:wherearethebarsat/widgets/bars_data_model.dart';

/*
* Takes care of the list of bars, displays the list of bars using a list view builder
 */
class BarListScreen extends StatefulWidget {
  final barList;
  BarListScreen({this.barList});

  @override
  _BarListScreenState createState() => _BarListScreenState();
}

class _BarListScreenState extends State<BarListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: ListView.builder(
          itemBuilder: (context, index) {
            return BarsDataModel(
              name: widget.barList['results'][index]['name'],
              photoReference: widget.barList['results'][index]['photos'] != null
                  ? widget.barList['results'][index]['photos'][0]
                      ['photo_reference']
                  : 'none',
              placeID: widget.barList['results'][index]['place_id'],
              rating: widget.barList['results'][index]['rating'] != null
                  ? widget.barList['results'][index]['rating']
                  : 0,
              numberOfReviews:
                  widget.barList['results'][index]['user_ratings_total'] != null
                      ? widget.barList['results'][index]['user_ratings_total']
                      : 0,
            );
          },
          itemCount: widget.barList['results'].length),
    );
  }
}
