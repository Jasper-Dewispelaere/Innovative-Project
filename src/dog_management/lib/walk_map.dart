// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class WalkMap extends StatefulWidget {
  const WalkMap({Key? key, required this.dog}) : super(key: key);
  final dynamic dog;

  @override
  State<WalkMap> createState() => _WalkMapState();
}

class _WalkMapState extends State<WalkMap> {
  Duration duration = const Duration();
  Timer? timer;
  bool timerStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timerStarted = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void endTimer() {
    timerStarted = false;
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 60,
          child: Center(
              child: Text(
            '${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}',
            style: const TextStyle(fontSize: 40),
          )),
        ),
        SizedBox(
            height: 562,
            child: OpenStreetMapSearchAndPick(
                center: LatLong(51.194963, 3.215242),
                buttonColor: Colors.brown,
                buttonText: timerStarted ? "End walk" : "Start walk",
                onPicked: (pickedData) {
                  timerStarted? endTimer() : startTimer();
                  print(pickedData.latLong.latitude);
                  print(pickedData.latLong.longitude);
                  print(pickedData.address);
                })),
      ],
    ));
  }
}
