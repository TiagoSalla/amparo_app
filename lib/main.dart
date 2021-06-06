import 'package:amparo_app/screen/asylum_selection/asylum_selection_screen.dart';
import 'package:flutter/material.dart';

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
          cursorColor: Colors.blueAccent),
      home: Scaffold(
        body: Center(
          child: AsylumSelection(),
        ),
      ),
    );
  }
}
