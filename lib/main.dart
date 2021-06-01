import 'dart:io';
import 'package:amparo_app/screens/home/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amparo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.blueAccent,
        cursorColor: Colors.blueAccent
      ),
      home: Scaffold(
        body: Center(
          child: AsylumSelection(title: "Lar São José",),
        ),
      ),
    );
  }
}

