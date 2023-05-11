import 'package:dog_management/dog_overview.dart';
import 'package:flutter/material.dart';
import 'models/dog.dart';
import 'services/dog_apiservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ReadDogsState();
}



class _ReadDogsState extends State<HomePage> {
  List<Dog> doggies = []; 

 @override
  void initState() {
    super.initState();
    // Move the logic to fetch dogs to the initState method
    DogApiService().getAllDogs().then((dogs) {
      setState(() {
        doggies = dogs; // Assign the fetched dogs to the list
      });
    }).catchError((error) {
      // ignore: avoid_print
      print('Error fetching dogs: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Stack(
        children: [
          Wrap(
            children: [
              for (var dog in doggies)
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
                              return DogOverview(dog: dog);
                            },
                          ),
                        );
                      },
                      // Add image & text
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'images/${dog.name}.jpg',
                            width: 220,
                            height: 180,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            dog.name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(dog.breed),
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
    ));
  }
}
