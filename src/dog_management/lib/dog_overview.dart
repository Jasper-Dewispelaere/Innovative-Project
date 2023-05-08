import 'package:flutter/material.dart';

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
          ),
        ],
      ),
    );
  }
}
