import 'package:dog_management/dog_overview.dart';
import 'package:dog_management/walk_overview.dart';
import 'package:flutter/material.dart';
import 'models/dog.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key, required this.dog}) : super(key: key);
  final Dog dog;
  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = DogOverview(dog: widget.dog);
        break;
      case 1:
        page = WalkOverview(dog: widget.dog);
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dog.name),
        automaticallyImplyLeading: false, //default back button disable
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: page,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pets),
            label: 'Info',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_walk),
            label: 'Walks',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
