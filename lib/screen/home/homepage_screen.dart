import 'package:flutter/material.dart';
import 'package:amparo_app/screen/login/login_screen.dart';

class AsylumSelection extends StatefulWidget {
  @override
  _AsylumSelection createState() => _AsylumSelection();
}

class _AsylumSelection extends State<AsylumSelection> {
  List<String> asylums = ['Lar São José', 'Lar São Franscisco', 'Asilo Vale dos Lírios'];
  late String dropdownValue = asylums.first;

  void _dropDownItemSelected(String newItem) {
    setState(() {
      this.dropdownValue = newItem;
    });
  }

  void _sendData(BuildContext context) {
    String asylumName = dropdownValue.toString();

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(asylumName: asylumName)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  'Vamos conectá-lo a uma casa de repouso',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'SF Pro Medium', fontWeight: FontWeight.w300, color: Colors.white),
                )
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
                      'Acesse sua conta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 6),
                      child: Text(
                        'Vamos verificar se você possui credenciais',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontFamily: 'SF Pro Medium', color: Color(0xFF9093A3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 4, top: 20, right: 10),
                      child: DropdownButton<String>(
                        hint: Text(
                          'Selecione uma casa de repouso',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontFamily: 'SF Pro', fontWeight: FontWeight.bold),
                        ),
                        value: dropdownValue,
                        iconEnabledColor: Colors.black,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontFamily: 'SF Pro', fontSize: 14),
                        underline: Container(
                          height: 2,
                          color: Color(0xFF1D6AFF),
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _dropDownItemSelected(newValue);
                          }
                        },
                        items: asylums.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 4, top: 2, right: 10),
                      child: RaisedButton(
                        color: Color(0xFF1D6AFF),
                        child: Text(
                          'Conectar',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'SF Pro', fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.blueAccent)),
                        onPressed: () {
                          _sendData(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
