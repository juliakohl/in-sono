import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_sono/screens/audio_overview_screen.dart';
import 'package:in_sono/screens/create_screen.dart';
import 'package:in_sono/screens/text_screen.dart';
import 'package:in_sono/screens/welcome_screen.dart';
import 'package:in_sono/screens/login_screen.dart';
import 'package:in_sono/screens/registration_screen.dart';
import 'package:in_sono/screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InSono());
}

class InSono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        CreateScreen.id: (context) => CreateScreen(),
        AudioOverviewScreen.id: (context) => AudioOverviewScreen(),
        TextScreen.id: (context) => TextScreen()
      },
    );
  }
}