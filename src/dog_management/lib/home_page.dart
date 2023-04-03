import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {},
          child:
              const Text('No dogs here yet :(, tap the plus icon to add one')),
    );
  }
}
