import 'package:flutter/material.dart';
import 'package:in_sono/screens/audio_overview_screen.dart';
import 'package:in_sono/screens/create_screen.dart';
import 'package:in_sono/screens/text_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;

  final _pageOptions = [
    AudioOverviewScreen(),
    CreateScreen(),
    TextScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Go to your profile',
            onPressed: () {
              print('clicked profile icon');
            },
          ),
          title: Text('In Sono'),
        ),
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.headset, size: 30), title: Text('Audio')),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 30), title: Text('Add New')),
            BottomNavigationBarItem(icon: Icon(Icons.format_align_center, size: 30), title: Text('Text')),
          ],
          elevation: 5.0,
          currentIndex: selectedPage,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )
    );
  }
}