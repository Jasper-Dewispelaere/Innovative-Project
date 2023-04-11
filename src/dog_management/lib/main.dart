import 'package:dog_management/add_dog.dart';
import 'package:dog_management/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class Dog {
  final String name;
  final Image picture;
  final String breed;
  final String sex;
  final DateTime dateOfBirth;
  final String color;

  Dog(this.name, this.picture, this.breed, this.sex, this.dateOfBirth, this.color);

  Dog.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        picture = json['picture'],
        breed = json['breed'],
        sex = json['sex'],
        dateOfBirth = json['date Of Birth'],
        color = json['color'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'picture': picture,
        'breed': breed,
        'sex': sex,
        'date Of Birth': dateOfBirth,
        'color': color,
      };
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Management'),
      ),
      body: const HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const AddDog();
                },
              ),
            );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
