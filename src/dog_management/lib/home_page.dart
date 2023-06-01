import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_management/dog_overview.dart';
import 'package:dog_management/overview.dart';
import 'package:flutter/material.dart';
import 'add_dog.dart';
import 'models/dog.dart';
import 'services/dog_apiservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ReadDogsState();
}

class _ReadDogsState extends State<HomePage> {
  List<Dog> doggies = [];

  Stream<List<Dog>> readDogs() => FirebaseFirestore.instance
    .collection('dogs')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Dog.fromSnapshot(doc)).toList());

  Widget buildDog(Dog dog) => ListTile(
    leading: CircleAvatar(child: Image.network(dog.image)),
    title: Text(dog.name),
    subtitle: Text(dog.breed),
  );

  @override
  void initState() {
    super.initState();
    // Move the logic to fetch dogs to the initState method
    // DogApiService().getAllDogs().then((dogs) {
    //   setState(() {
    //     doggies = dogs; // Assign the fetched dogs to the list
    //   });
    // }).catchError((error) {
    //   // ignore: avoid_print
    //   print('Error fetching dogs: $error');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Dog>>(
        stream: readDogs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
            else if(snapshot.hasData) {
              final dogs = snapshot.data;

              return ListView(
                children: dogs.map(buildDog).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const AddDog();
              },
            ),
          ).then((value) => DogApiService().getAllDogs().then((dogs) {
                setState(() {
                  doggies = dogs; // Assign the fetched dogs to the list
                });
              }).catchError((error) {
                // ignore: avoid_print
                print('Error fetching dogs: $error');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
