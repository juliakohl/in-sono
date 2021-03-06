import 'package:flutter/material.dart';
import 'package:in_sono/components/rounded_button.dart';
import 'package:in_sono/screens/text_screen.dart';
import 'package:in_sono/screens/create_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class AudioOverviewScreen extends StatefulWidget {
  static const String id = 'audio_overview_screen';

  @override
  _AudioOverviewState createState() => _AudioOverviewState();
}

class _AudioOverviewState extends State<AudioOverviewScreen> {

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
          FlatButton(onPressed: () {
            print('button got pressed');
          }, child: Text('Category 1'))
        ],
      ),
    );
  }
}