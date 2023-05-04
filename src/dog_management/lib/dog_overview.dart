import 'package:flutter/material.dart';

class DogOverview extends StatefulWidget {
  const DogOverview({super.key});

  @override
  State<DogOverview> createState() => _DogOverviewState();
}

class _DogOverviewState extends State<DogOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog'),
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
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Amy',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Image.asset(
            'images/amy.jpg',
            width: 260,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('Elevated Button');
            },
            child: const Text('Elevated'),
          ),
          OutlinedButton(
            onPressed: () {
              debugPrint('Outlined Button');
            },
            child: const Text('Outlined'),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Text Button');
            },
            child: const Text('Text button'),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              debugPrint('This is pressed');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.red,
                ),
                Text('Row'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
