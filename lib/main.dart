import 'package:flutter/material.dart';
import 'package:in_sono/screens/create_screen.dart';
import 'package:in_sono/screens/welcome_screen.dart';
import 'package:in_sono/screens/login_screen.dart';
import 'package:in_sono/screens/registration_screen.dart';
import 'package:in_sono/screens/create_screen.dart';

// TODO: add Firebase App for iOS

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(InSono());
}

class InSono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CreateScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        CreateScreen.id: (context) => CreateScreen(),
      },
    );
  }
}