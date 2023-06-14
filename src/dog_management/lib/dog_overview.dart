import 'package:dog_management/services/dog_firestoreservice.dart';
import 'package:flutter/material.dart';

class DogOverview extends StatefulWidget {
  const DogOverview({Key? key, required this.dog}) : super(key: key);
  final dynamic dog;
  @override
  State<DogOverview> createState() => _OverviewState();
}

class _OverviewState extends State<DogOverview> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              widget.dog["name"],
              style: const TextStyle(fontSize: 50),
            ),
          ),
          Image.network(
            widget.dog["image"],
            width: 260,
            alignment: Alignment.center,
          ),
          const Text(
            "Breed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["breed"],
            style: const TextStyle(fontSize: 15),
          ),
          const Icon(Icons.male),
          const Text(
            "Date of Birth",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["dateOfBirth"],
            style: const TextStyle(fontSize: 15),
          ),
          const Text(
            "Color",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.dog["color"],
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () => showDialog<String>(
          context: context, 
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Deleting Warning!'),
            content: Text('Are you sure you wanna delete ${widget.dog["name"]}? This action can\'t be undone!'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),  
                child: const Text('No, cancel'),
              ),
              TextButton(
                onPressed: (){DogFirestoreService().deleteDog(widget.dog["id"]); Navigator.of(context).popUntil((route) => route.isFirst);}, 
                child: const Text('Yes, delete'),
                )
            ],
          ))
          ),
    );
  }
}
