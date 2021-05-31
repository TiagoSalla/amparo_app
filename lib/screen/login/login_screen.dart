import 'package:amparo_app/screen/resident_list/resident_list_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final bool _showPassword = false;
  final String asylumName;

  Login({required this.asylumName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              width: 40,
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 0.0, top: 8.0, right: 8.0, bottom: 8.0),

              child: Text(
                'amparo',
                style: TextStyle(
                  fontFamily: 'Audiowide',
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF1D6AFF),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF1D6AFF),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    'Bem-vindo ao ' + asylumName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                ),
                Text(
                    'Informe suas credenciais de acesso',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Medium',
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                )
              ],
            ),
          ),
          Container(
            child: Card(
              margin:  const EdgeInsets.symmetric(horizontal: 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50), topRight: Radius.circular(50)
                  )
              ),
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
                        'Caso não possua credenciais de acesso, contate o administrador',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'SF Pro Medium',
                            color: Color(0xFF9093A3)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,  top: 0, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Informe o usuário',
                          labelText: 'Usuário',
                          labelStyle: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,  top: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Informe a senha',
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword == false ? Icons.visibility_off : Icons.visibility,
                                color: Color(0xFF9093A3)
                            ),
                          )
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: GestureDetector(
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            fontFamily: 'SF Pro Medium',
                            color: Color(0xFF9093A3),
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 4, top: 10, right: 10),
                      child: RaisedButton(
                        color: Color(0xFF1D6AFF),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF Pro',
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.blueAccent)
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResidentList())),
                      ),
                    ),],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
