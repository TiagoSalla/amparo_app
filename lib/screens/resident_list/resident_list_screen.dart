import 'package:amparo_app/model/resident.dart';
import 'package:amparo_app/network/resident_http_service.dart';
import 'package:amparo_app/screen/asylum_selection/asylum_selection_screen.dart';
import 'package:flutter/material.dart';

class ResidentList extends StatefulWidget {
  ResidentList({Key? key}) : super(key: key);

  @override
  _ResidentListState createState() => _ResidentListState();
}

class _ResidentListState extends State<ResidentList> {
  final ResidentHttpService service = ResidentHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: service.getResidents(),
        builder: (BuildContext context, AsyncSnapshot<List<Resident>> snapshot) {
          if (snapshot.hasData) {
            List<Resident> residents = snapshot.data!;
            return ListView(
              children: residents.map(
                      (Resident resident) => ListTile(
                        title: Text(resident.name),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AsylumSelection(title: "Batatinha"))),
                      )
              ).toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
