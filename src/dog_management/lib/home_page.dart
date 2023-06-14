// ignore_for_file: avoid_print
import 'package:dog_management/overview.dart';
import 'package:dog_management/services/dog_firestoreservice.dart';
import 'package:flutter/material.dart';
import 'add_dog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ReadDogsState();
}

class _ReadDogsState extends State<HomePage> {
  var alldogs = [];

  @override
  void initState() {
    super.initState();

    DogFirestoreService().allDogs().then((dogs) {
      setState(() {
        alldogs = dogs; // Assign the fetched dogs to the list
      });
    }).catchError((error) {
      print('Error fetching dogs: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dog Management'), actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                setState(() {});
              },
              child: const Icon(
                Icons.refresh,
                size: 26.0,
              ),
            )),
      ]),
      body: SingleChildScrollView(
          child: Center(
        child: Stack(
          children: [
            // ElevatedButton(onPressed: () async{ setState(() {});}, child: Text('Refresh')),
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
          ).then((value) => DogFirestoreService().allDogs().then((dogs) {
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
