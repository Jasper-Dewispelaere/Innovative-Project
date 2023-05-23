// ignore_for_file: avoid_print
import 'package:dog_management/services/dog_apiservice.dart';
import 'package:dog_management/services/dog_mockservice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'models/dog.dart';

class AddWalk extends StatefulWidget {
  const AddWalk({Key? key, required this.dog}) : super(key: key);
  final Dog dog;

  @override
  State<AddWalk> createState() => _AddWalkState();
}

class _AddWalkState extends State<AddWalk> {
  final _formKey = GlobalKey<FormState>();
  //TextControllers form
  final textController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final distanceController = TextEditingController();
  final breedController = TextEditingController();
  String sexController = "Male";

  String text = "";
  DateTime date = DateTime.now();
  final ImagePicker picker = ImagePicker();
  DogMockService dogservice = DogMockService();
  
    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          sexController = selectedValue;
        });
      }
    }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Walk'),
        automaticallyImplyLeading: false, //default back button disable
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name for the walk';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.directions_walk),
                    hintText: 'Enter the name of the walk',
                    labelText: 'Name Walk',
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    hintText: 'Select the date',
                    labelText: 'Date',
                  ),
                  onTap: () async {
                    DateTime? newDateOfBirth = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1980),
                        lastDate: date);
                    if (newDateOfBirth != null) {
                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(newDateOfBirth);
                      setState(() {
                        dateController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a distance';
                    }
                    return null;
                  },
                  controller: distanceController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    hintText: 'Enter the distance',
                    labelText: 'Distance (in km)',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a duration';
                    }
                    return null;
                  },
                  controller: distanceController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.timelapse),
                    hintText: 'Enter the duration',
                    labelText: 'Duration (in minutes)',
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Dog newDog = Dog(
                                id: widget.dog.id,
                                name: widget.dog.name,
                                breed: widget.dog.breed,
                                sex: widget.dog.sex,
                                dateOfBirth: widget.dog.dateOfBirth,
                                image: widget.dog.image,
                                color: widget.dog.color,
                                walks: []);
                            DogApiService().addDog(newDog);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add Walk'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
