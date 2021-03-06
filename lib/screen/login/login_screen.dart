import '../../network/professional_http_service.dart';
import '../../screen/about/about_screen.dart';
import '../../utils/page_routers/default_page_router.dart';
import '../../network/session.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String asylumName;
  final ProfessionalHttpService service = ProfessionalHttpService();

  Login({required this.asylumName});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  bool _callingApi = false;
  bool _showPassword = false;
  String _username = "";
  String _password = "";

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ocorreu um problema ao entrar'),
        content: const Text('Verifique as informações inseridas.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

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
                  'Bem-vindo ao\n' + widget.asylumName,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 34, fontFamily: 'SF Pro', fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                  'Informe suas credenciais de acesso',
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
                        'Caso não possua credenciais de acesso, contate o administrador',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontFamily: 'SF Pro Medium', color: Color(0xFF9093A3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Informe o usuário',
                          labelText: 'Usuário',
                          labelStyle: TextStyle(
                              fontFamily: 'SF Pro', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onChanged: (user) {
                          this._username = user;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Informe a senha',
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                fontFamily: 'SF Pro', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            suffixIcon: GestureDetector(
                              child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility,
                                  color: Color(0xFF9093A3)),
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            )),
                        keyboardType: TextInputType.text,
                        obscureText: !_showPassword,
                        onChanged: (password) {
                          this._password = password;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 4, top: 10, right: 10),
                      child: RaisedButton(
                        color: Color(0xFF1D6AFF),
                        child: _callingApi
                            ? Container(width: 20, height: 20, child: CircularProgressIndicator(),)
                            : Text(
                                'Entrar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF Pro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.blueAccent)),
                        onPressed: () async {
                          setState(() {
                            _callingApi = true;
                          });

                          final bool isValid = await widget.service.login(_username, _password);

                          setState(() {
                            _callingApi = false;
                          });

                          if (isValid) {
                            Session.shared.asylumName = widget.asylumName;
                            Session.shared.username = _username;
                            Navigator.of(context).push(DefaultPageRouter(widget: About()));
                          } else {
                            _showDialog(context);
                          }
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
