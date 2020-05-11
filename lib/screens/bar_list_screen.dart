import 'package:flutter/material.dart';
import 'package:wherearethebarsat/screens/loading_screen.dart';
import 'package:wherearethebarsat/widgets/bars_data_model.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:wherearethebarsat/services/data_retriever.dart';

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

  //Go to loading screen when back button pressed (when this route is being disposed, pop this route)
  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  //Builds the list using a list view builder with an item builder for each bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        onRefresh: () async {
          var barListData = await BarsModel().getLocationBars();
          //Pop context, then build new one to save memory
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BarListScreen(
              barList: barListData,
            );
          }));
        },
        child: ListView.builder(
            itemBuilder: (context, index) {
              return BarsDataModel(
                name: widget.barList['results'][index]['name'],
                photoReference:
                    widget.barList['results'][index]['photos'] != null
                        ? widget.barList['results'][index]['photos'][0]
                            ['photo_reference']
                        : 'none',
                placeID: widget.barList['results'][index]['place_id'],
                rating: widget.barList['results'][index]['rating'] != null
                    ? widget.barList['results'][index]['rating']
                    : 0,
                numberOfReviews: widget.barList['results'][index]
                            ['user_ratings_total'] !=
                        null
                    ? widget.barList['results'][index]['user_ratings_total']
                    : 0,
              );
            },
            itemCount: widget.barList['results'].length),
      ),
    );
  }
}
