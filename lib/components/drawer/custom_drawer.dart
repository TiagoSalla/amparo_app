import 'package:amparo_app/model/responses/professional.dart';
import 'package:amparo_app/screen/about/about_screen.dart';
import 'package:amparo_app/screen/medicine/medicine_list/medicine_list_screen.dart';
import 'package:amparo_app/screen/professional/professional_list/professional_list_screen.dart';
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
  late final DefaultPageRouter professionalRouter = DefaultPageRouter(widget: ProfessionalList());

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF1D6AFF), Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.28, 0.28])),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
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
                                  color: Colors.white,),
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
                            style: TextStyle(fontFamily: 'SF Pro', fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
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
              DrawerTile(Icons.info, ABOUT, aboutRouter),
              DrawerTile(Icons.badge, RESIDENTS, residentRouter),
              DrawerTile(Icons.people, RESPONSIBLES, residentRouter),
              DrawerTile(Icons.perm_contact_cal, PROFESSIONALS, professionalRouter),
              DrawerTile(Icons.medical_services, MEDICINES, medicineRouter),
              DrawerTile(Icons.assignment, TREATMENTS, residentRouter),
            ],
          )
        ],
      ),
    );
  }
}
