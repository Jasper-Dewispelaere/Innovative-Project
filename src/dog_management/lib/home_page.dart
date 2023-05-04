import 'dart:convert';

import 'package:dog_management/dog_overview.dart';
import 'package:dog_management/services/dogMockService.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'models/dog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ReadDogsState();
}

class _ReadDogsState extends State<HomePage> {
  String recievedJson = "";
  //final dogs = dogMockService.getAllDogs();

  Future<void> readFile() async {

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dog.txt');
      recievedJson = await file.readAsString();
      Map<String, dynamic> dogMap = jsonDecode(recievedJson);
      var jsonDog = Dog.fromJson(dogMap);
      print(jsonDog.name);
      //dogs = jsonDog;
    } catch (e) {
      debugPrint('FOUT');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DogOverview();
                  },
                ),
              );
            },
            child: const Text(
                'No dogs here yet :(, tap the plus icon to add one')),
        ElevatedButton(
          onPressed: () async {
            await readFile(); //calls readFile()
            setState(() {}); //rebuilds the UI.
          },
          child: const Text('Read File'),
        ),
        const SizedBox(
          height: 18,
        ),
        if (dogs != null) Text(dogs.name),

      ],
    );
  }
}
