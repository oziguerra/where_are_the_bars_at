import 'package:flutter/material.dart';
import 'package:wherearethebarsat/widgets/bars_data_model.dart';

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
                name: widget.barList['results'][index]['name']);
          },
          itemCount: widget.barList['results'].length),
    );
  }
}
