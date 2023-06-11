import 'package:flutter/material.dart';
import 'add_walk.dart';

class WalkOverview extends StatefulWidget {
  const WalkOverview({Key? key, required this.dog}) : super(key: key);
  final dynamic dog;
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
          for (var walk in widget.dog["walks"])
            Center(
              child: Container(
                height: 100,
                width: 250,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 15)
                ], color: Colors.white),
                child: Column(
                  children: [
                    Text(walk["name"],
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(walk["date"],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Text(
                          "${walk["distance"].toString()} km in ${walk["time"].toString()} minutes"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddWalk(dog: widget.dog);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
