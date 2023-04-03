import 'package:flutter/material.dart';

class DogOverview extends StatefulWidget {
  const DogOverview({super.key});

  @override
  State<DogOverview> createState() => _DogOverviewState();
}

class _DogOverviewState extends State<DogOverview> {
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
          Image.asset('images/')
        ],
      ),
    );
  }
}
