import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'models/dog.dart';

class AddDog extends StatefulWidget {
  const AddDog({super.key});

  @override
  State<AddDog> createState() => _AddDogState();
}

class _AddDogState extends State<AddDog> {
  final _formKey = GlobalKey<FormState>();
  //TextControllers form
  final textController = TextEditingController();
  final nameController = TextEditingController();
  final breedController = TextEditingController();
  final sexController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final colorController = TextEditingController();

  String text = "";
  Dog newDog = Dog("", "", "", DateTime.now(), "");
  DateTime date = DateTime.now();
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future<void> createFile(String text) async {
    //provides directory path.
    final directory = await getApplicationDocumentsDirectory();
    //creates text_file in the provided path.
    final file = File('${directory.path}/dog.txt');
    await file.writeAsString(text);
  }

  Future<void> readFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dog.txt');
      text = await file.readAsString();
    } catch (e) {
      debugPrint('exception');
    }
  }

  //for the image, can upload from camera or from gallery
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      XFile? img = XFile(image.path);
      setState(() {
        _image = img;

      });
    } on PlatformException catch (e) {
      print(e);
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
        title: const Text('Add Dog'),
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
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.pets),
                    hintText: 'Enter your dog\'s name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a breed';
                    }
                    return null;
                  },
                  controller: breedController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.favorite),
                    hintText: 'Enter your dog\'s breed',
                    labelText: 'Breed',
                  ),
                ),
                TextFormField(
                  controller: sexController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.male),
                    hintText: 'Select your dog\'s sex',
                    labelText: 'Sex',
                  ),
                ),
                TextFormField(
                  controller: dateOfBirthController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    hintText: 'Select the Date of Birth',
                    labelText: 'Date of Birth',
                  ),
                  onTap: () async {
                    DateTime? newDateOfBirth = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1980),
                        lastDate: date);
                    if (newDateOfBirth != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(newDateOfBirth);
                      setState(() {
                        dateOfBirthController.text =
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
                      return 'Please enter a color';
                    }
                    return null;
                  },
                  controller: colorController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.palette),
                    hintText: 'Enter the dog\'s color',
                    labelText: 'Color',
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 165.0, vertical: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Dog addDog = Dog(
                              nameController.text,
                              breedController.text,
                              sexController.text,
                              DateTime.parse(dateOfBirthController.text),
                              colorController.text);

                          final json = addDog.toJson();
                          print('JSON: ${addDog.toJson()}');

                          final addedDog = Dog.fromJson(json);
                          print('${addedDog}');

                          createFile(json.toString());
                        }
                      },
                      child: const Text('Add Dog'),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center, //input aligns to center
              controller: textController,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: const Text('Create File'),
            onPressed: () => createFile(
                textController.text), //calls createFile() when //button pressed
          ),
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
          if (text != null) Text(text)
        ],
      ),
    );
  }
}
