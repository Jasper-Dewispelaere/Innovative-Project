import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/dog.dart';

class DogOverview extends StatelessWidget {
  const DogOverview({super.key, required this.dog});

  final Dog dog;
  @override
  Widget build(BuildContext context) {
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
              dog.name,
              style: const TextStyle(fontSize: 50),
            ),
          ),
          Image.asset(
            'images/${dog.name}.jpg',
            width: 260,
            alignment: Alignment.center,
          ),
          const Text(
            "Dog information: ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Breed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            dog.breed,
            style: const TextStyle(fontSize: 15),
          ),
          const Icon(Icons.male),
          const Text(
            "Date of Birth",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat.yMd().format(dog.dateOfBirth),
            style: const TextStyle(fontSize: 15),
          ),
          const Text(
            "Color",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            dog.color,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
