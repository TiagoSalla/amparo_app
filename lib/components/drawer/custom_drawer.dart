import 'package:amparo_app/screen/about/about_screen.dart';
import 'package:amparo_app/screen/medicine/medicine_list/medicine_list_screen.dart';
import 'package:amparo_app/screen/resident/resident_list/resident_list_screen.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/network/session.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:amparo_app/components/drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  late final DefaultPageRouter aboutRouter = DefaultPageRouter(widget: About());
  late final DefaultPageRouter residentRouter = DefaultPageRouter(widget: ResidentList());
  late final DefaultPageRouter medicineRouter = DefaultPageRouter(widget: MedicineList());

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
                              AMPARO,
                              style: TextStyle(
                                  fontFamily: 'Audiowide',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              Session.shared.asylumName,
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
                            HELLO + Session.shared.username,
                            style: TextStyle(fontFamily: 'SF Pro', fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   'Configurar conta',
                          //   style: TextStyle(
                          //     fontFamily: 'SF pro',
                          //     fontSize: 16.0,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, ABOUT, aboutRouter),
              DrawerTile(Icons.people_alt, RESIDENTS, residentRouter),
              DrawerTile(Icons.person, RESPONSIBLES, residentRouter),
              DrawerTile(Icons.home, PROFESSIONALS, residentRouter),
              DrawerTile(Icons.medical_services, MEDICINES, medicineRouter),
              DrawerTile(Icons.home, TREATMENTS, residentRouter),
            ],
          )
        ],
      ),
    );
  }
}
