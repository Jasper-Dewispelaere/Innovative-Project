// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_management/dog_overview.dart';
import 'package:dog_management/overview.dart';
import 'package:dog_management/services/dog_firestoreservice.dart';
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

  var alldogs = [];
  final _db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    _db.collection("dogs").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          alldogs.add(
            {'data': docSnapshot.data(), 'id': docSnapshot.id}
          );
          print(' id: ${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Stack(
          children: [
            Wrap(
              children: [
                for (var dog in alldogs)
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: Card(
                      elevation: 6,
                      color: Colors.white,
                      semanticContainer: true,
                      // Implement InkResponse
                      child: InkResponse(
                        containedInkWell: true,
                        highlightShape: BoxShape.rectangle,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Overview(dog: dog["data"]);
                              },
                            ),
                          );
                        },
                        // Add image & text
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              dog["data"]["image"],
                              width: 220,
                              height: 180,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              dog["data"]["name"],
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(dog["data"]["breed"]),
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      )),
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
                  alldogs = dogs; // Assign the fetched dogs to the list
                });
              }).catchError((error) {
                print('Error fetching dogs: $error');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
