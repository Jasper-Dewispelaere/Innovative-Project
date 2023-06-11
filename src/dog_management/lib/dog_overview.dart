import 'package:flutter/material.dart';

class DogOverview extends StatefulWidget {
  const DogOverview({Key? key, required this.dog}) : super(key: key);
  final dynamic dog;
  @override
  State<DogOverview> createState() => _OverviewState();
}

class _OverviewState extends State<DogOverview> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              widget.dog["name"],
              style: const TextStyle(fontSize: 50),
            ),
          ),
          Image.network(
            widget.dog["image"],
            width: 260,
            alignment: Alignment.center,
          ),
          const Text(
            "Breed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["breed"],
            style: const TextStyle(fontSize: 15),
          ),
          const Icon(Icons.male),
          const Text(
            "Date of Birth",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["dateOfBirth"],
            style: const TextStyle(fontSize: 15),
          ),
          const Text(
            "Color",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["color"],
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
