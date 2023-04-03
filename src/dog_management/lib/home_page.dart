import 'package:dog_management/dog_overview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const DogOverview();
                },
              ),
            );
          },
          child:
              const Text('No dogs here yet :(, tap the plus icon to add one')),
    );
  }
}
