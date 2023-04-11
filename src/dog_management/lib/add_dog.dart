import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AddDog extends StatefulWidget {
  const AddDog({super.key});

  @override
  State<AddDog> createState() => _AddDogState();
}

class _AddDogState extends State<AddDog> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String text = "";
  DateTime date = DateTime.now();

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
                  decoration: const InputDecoration(
                    icon: Icon(Icons.pets),
                    hintText: 'Enter your dog\'s name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.favorite),
                    hintText: 'Enter your dog\'s breed',
                    labelText: 'Breed',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.male),
                    hintText: 'Select your dog\'s sex',
                    labelText: 'Sex',
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: '${date.day}/${date.month}/${date.year}'),
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
                        if(newDateOfBirth == null) return;
                        setState(() => date = newDateOfBirth);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.palette),
                    hintText: 'Select the dog\'s color',
                    labelText: 'Color',
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    child: ElevatedButton(
                      onPressed: () {},
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
