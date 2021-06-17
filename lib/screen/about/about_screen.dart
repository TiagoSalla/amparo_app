import '../../components/drawer/custom_drawer.dart';
import '../../utils/strings/texts.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D6AFF),
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color(0xFF1D6AFF),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  height: 100,
                  width: 80,
                ),
                Text(
                  'amparo |>',
                  style: TextStyle(
                      fontSize: 34, fontFamily: 'Audiowide', fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'História do Amparo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 6),
                      child: Text( ABOUT_AMPARO,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontFamily: 'SF Pro Medium', color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
