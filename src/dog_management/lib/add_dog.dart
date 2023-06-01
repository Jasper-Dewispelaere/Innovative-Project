// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_management/services/dog_apiservice.dart';
import 'package:dog_management/services/dog_mockservice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final dateOfBirthController = TextEditingController();
  final imageController = TextEditingController();
  final colorController = TextEditingController();
  final sexController = TextEditingController();

  String text = "";
  DateTime date = DateTime.now();
  final ImagePicker picker = ImagePicker();
  DogMockService dogservice = DogMockService();
  
    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          text = selectedValue;
        });
      }
    }

  // Future<void> createFile(String text) async {
  //   //provides directory path.
  //   final directory = await getApplicationDocumentsDirectory();
  //   //creates text_file in the provided path.
  //   final file = File('${directory.path}/dog.txt');
  //   await file.writeAsString(text);
  // }

  // Future<void> readFile() async {
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final file = File('${directory.path}/dog.txt');
  //     text = await file.readAsString();
  //   } catch (e) {
  //     debugPrint('exception');
  //   }
  // }

  //for the image, can upload from camera or from gallery
  // Future _pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     XFile? img = XFile(image.path);
  //     setState(() {
  //       _image = img;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }

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
                    hintText: 'Select your dog\'s gender',
                    labelText: 'Gender',
                  ),
                ),
                // DropdownButton(
                //   hint: const Text("Sex"),
                //   items: const [
                //     DropdownMenuItem(value: "Male", child: Text("Male")),
                //     DropdownMenuItem(value: "Female", child: Text("Female")),
                //   ],
                //   onChanged: dropdownCallback,
                // ),
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
                          DateFormat('dd/MM/yyyy').format(newDateOfBirth);
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
                      return 'Please enter an image (url)';
                    }
                    return null;
                  },
                  controller: imageController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.image),
                    hintText: 'Enter an url to an image\'s of the dog',
                    labelText: 'Image (url)',
                  ),
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final docDog = FirebaseFirestore.instance.collection("dogs").doc();
                            Dog newDog = Dog(
                                id: docDog.id,
                                name: nameController.text,
                                breed: breedController.text,
                                sex: sexController.text,
                                dateOfBirth: dateOfBirthController.text,
                                image: imageController.text,
                                color: colorController.text,
                                walks: [""]);
                            final json = newDog.toJson();
                            await docDog.set(json);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add Dog'),
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
