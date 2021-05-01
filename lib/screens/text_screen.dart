import 'package:flutter/material.dart';
import 'package:in_sono/components/rounded_button.dart';
import 'package:in_sono/screens/audio_overview_screen.dart';
import 'package:in_sono/screens/create_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class TextScreen extends StatefulWidget {
  static const String id = 'text_screen';

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200.0,
            width: double.infinity,
          ),
          Text('text screen'),
        ],
      ),
    );
  }
}