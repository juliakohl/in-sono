import 'package:flutter/material.dart';
import 'package:in_sono/components/rounded_button.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class CreateScreen extends StatefulWidget {
  static const String id = 'create_screen';

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Audio',
      style: optionStyle,
    ),
    Text(
      'Index 1: Create',
      style: optionStyle,
    ),
    Text(
      'Index 2: Text',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Add a new text source'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200.0,
              width: double.infinity,
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white,),
              tooltip: 'You can use your camera to scan any text you have in front of you.',
              onPressed: () {
                print('camera opened');
              },
            ),
            Text('Scan text with camera', style: TextStyle(color: Colors.white),),
            SizedBox(
              height: 48.0,
              width: double.infinity,
            ),
            IconButton(
              icon: const Icon(Icons.file_upload, color: Colors.white,),
              tooltip: 'You can upload a document in xy format as a text source.',
              onPressed: () {
                print('document added');
              },
            ),
            Text('Scan text with camera', style: TextStyle(color: Colors.white),),
            SizedBox(
              height: 96.0,
              width: double.infinity,
            ),
            RoundedButton(title: 'Continue to the next step', colour: Colors.deepPurpleAccent, onPressed: () { print('continue to create step 2');}),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1F1F1F),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.headset),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_center),
            label: 'Text',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}