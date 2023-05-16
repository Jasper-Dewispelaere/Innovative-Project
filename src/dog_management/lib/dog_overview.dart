import 'package:flutter/material.dart';
import 'models/dog.dart';

class DogOverview extends StatefulWidget {
  const DogOverview({Key? key, required this.dog}) : super(key: key);
  final Dog dog;
  @override
  State<DogOverview> createState() => _OverviewState();
}

class _OverviewState extends State<DogOverview> {
  
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog'),
        automaticallyImplyLeading: false, //default back button disable
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.dog.name,
              style: const TextStyle(fontSize: 50),
            ),
          ),
          Image.network(
            widget.dog.image,
            width: 260,
            alignment: Alignment.center,
          ),
          // const Text(
          //   "Dog information: ",
          //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          // ),
          const Text(
            "Breed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog.breed,
            style: const TextStyle(fontSize: 15),
          ),
          const Icon(Icons.male),
          const Text(
            "Date of Birth",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            // DateFormat.yMd().format(dog.dateOfBirth),
            widget.dog.walks.length.toString(),
            style: const TextStyle(fontSize: 15),
          ),
          const Text(
            "Color",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog.color,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
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
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
