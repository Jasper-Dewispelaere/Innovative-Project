// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dog_management/models/dog.dart';
import 'package:http/http.dart' as http;

class DogApiService {
  List<Dog> dogs = [];
  String baseUrl = "http://192.168.0.133:5001/api/dogs"; //<---- zelf vervangen door eigen IP-adres http://HIER_EIGEN_IP:5001/api/dogs

  Future<List<Dog>> getAllDogs() async {
    final response =
        await http.get(Uri.parse(baseUrl));
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Dog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }

  Future addDog(Dog addDog) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': addDog.name,
        'breed': addDog.breed,
        'sex': addDog.sex,
        'dateOfBirth': addDog.dateOfBirth,
        'image': addDog.image,
        'color': addDog.color,
        'walks' : addDog.walks
      }),
    );

    if(response.statusCode == 201){
      //return Dog.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create a new Dog!');
    }
  }

  Future editDog(Dog editDog) async{
    final response = await http.put(
      Uri.parse(baseUrl + editDog.id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': editDog.name,
        'breed': editDog.breed,
        'sex': editDog.sex,
        'dateOfBirth': editDog.dateOfBirth,
        'image': editDog.image,
        'color': editDog.color,
        'walks' : editDog.walks
      }),
    );

     if(response.statusCode == 201){
      //return Dog.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to edit a Dog!');
    }
  }
}
