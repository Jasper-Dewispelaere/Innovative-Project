import 'package:flutter/material.dart';
import 'models/dog.dart';

class WalkOverview extends StatefulWidget {
  const WalkOverview({Key? key, required this.dog}) : super(key: key);
  final Dog dog;
  @override
  State<WalkOverview> createState() => _OverviewState();
}

class _OverviewState extends State<WalkOverview> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        for (var walk in widget.dog.walks)
          Container(
            height: 150,
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Text(walk["name"], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(walk["date"], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text("${walk["distance"].toString()} km in ${walk["time"].toString()} minutes"),
                  ],
                )
              ],
            ),
          ),
      ],
    ));
  }
}