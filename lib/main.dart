import 'package:flutter/material.dart';

import 'src/pages/auth/sign_in_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quitanda',
      theme: ThemeData(


        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white70
      ),
      debugShowCheckedModeBanner: false,
      home:  SignInScreen(),
    );
  }
}

