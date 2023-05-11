import 'dart:convert';

import 'package:dog_management/models/dog.dart';
import 'package:http/http.dart' as http;

class DogApiService {
  List<Dog> dogs = [];

  Future<List<Dog>> getAllDogs() async {
    final response = await http.get(Uri.parse('http://localhost:5001/api/dogs'));
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Dog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }

  void addDog(Dog addDog) {
    dogs.add(addDog);
  }
}

