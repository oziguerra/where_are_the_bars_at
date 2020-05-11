import 'package:flutter/material.dart';
import 'package:wherearethebarsat/screens/bar_list_screen.dart';
import 'package:wherearethebarsat/services/data_retriever.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Get nearest bars, and after data is retrieved, go to where the bar list is being displayed
  void getLocationData() async {
    var barListData = await BarsModel().getLocationBars();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BarListScreen(
        barList: barListData,
      );
    }));
  }

  //When app starts, get nearest bars
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
