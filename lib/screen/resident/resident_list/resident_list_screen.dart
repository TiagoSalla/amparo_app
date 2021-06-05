import 'package:amparo_app/model/resident.dart';
import 'package:amparo_app/network/resident_http_service.dart';
import 'package:amparo_app/screen/asylum_selection/asylum_selection_screen.dart';
import 'package:flutter/material.dart';

class ResidentList extends StatefulWidget {
  ResidentList();

  @override
  _ResidentListState createState() => _ResidentListState();
}

class _ResidentListState extends State<ResidentList> {
  final ResidentHttpService service = ResidentHttpService();
  late Future<List<Resident>> residentList;

  @override
  void initState() {
    super.initState();
    residentList = service.getResidents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: residentList,
        builder: (BuildContext context, AsyncSnapshot<List<Resident>> snapshot) {
          if (snapshot.hasData) {
            List<Resident> residents = snapshot.data!;
            return ListView(
              children: residents
                  .map((Resident resident) => ListTile(
                        title: Text(resident.name),
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => AsylumSelection())),
                      ))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
