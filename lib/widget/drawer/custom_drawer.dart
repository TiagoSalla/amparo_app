import 'package:amparo_app/widget/drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String asylumName;
  final String username;
  final PageController pageController;

  CustomDrawer(this.asylumName, this.username, this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF1D6AFF), Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 10.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 170.0,

                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'amparo |>',
                              style: TextStyle(
                                  fontFamily: 'Audiowide',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              asylumName,
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Olá ' + username,
                            style: TextStyle(fontFamily: 'SF Pro', fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Configurar conta',
                            style: TextStyle(
                              fontFamily: 'SF pro',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Sobre', pageController, 0),
              DrawerTile(Icons.people_alt, 'Residentes', pageController, 1),
              DrawerTile(Icons.person, 'Responsavéis - residentes', pageController, 2),
              DrawerTile(Icons.home, 'Profissionais', pageController, 3),
              DrawerTile(Icons.medical_services, 'Medicamentos', pageController, 4),
              DrawerTile(Icons.home, 'Tratamentos', pageController, 5),
            ],
          )
        ],
      ),
    );
  }
}
