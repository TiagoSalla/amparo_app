import 'package:amparo_app/model/resident.dart';
import 'package:amparo_app/network/resident_http_service.dart';
import 'package:amparo_app/screen/asylum_selection/asylum_selection_screen.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:amparo_app/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class ResidentList extends StatefulWidget {
  final ResidentHttpService service = ResidentHttpService();

  ResidentList({Key? key}) : super(key: key);

  @override
  _ResidentListState createState() => _ResidentListState();
}

class _ResidentListState extends State<ResidentList> {
  late Future<List<Resident>> residentList;

  @override
  void initState() {
    super.initState();
    residentList = widget.service.getResidents();
  }

  Future<void> _didSelectAction(Map<String, int> selection) async {
    if (selection.keys.first == EDIT) {
      Navigator.of(context).push(DefaultPageRouter(widget: ResidentList()));
    } else if (selection.keys.first == DELETE) {
      final bool isValid = await widget.service.deleteResident(selection.values.first);

      if (isValid) {
        _showDialog(context, "Excluído com sucesso", "O residente foi excluído com sucesso!");

        setState(() {
          residentList = widget.service.getResidents();
        });
      } else {
        _showDialog(context, "Falha ao excluir", "Não foi possível excluir o residente. Tente novamente.");
      }
    }
  }

  _showDialog(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
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
        title: Text(
          RESIDENTS,
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1D6AFF),
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: residentList,
        builder: (BuildContext context, AsyncSnapshot<List<Resident>> snapshot) {
          if (snapshot.hasData) {
            List<Resident>? residents = snapshot.data;
            if (residents != null) {
              return ListView(
                children: residents
                    .map(
                      (Resident resident) => Card(
                        child: ListTile(
                            title: Text(resident.name),
                            trailing: PopupMenuButton(
                              onSelected: _didSelectAction,
                              itemBuilder: (BuildContext context) {
                                return ACTIONS.map((String action) {
                                  return PopupMenuItem<Map<String, int>>(
                                    value: {action: resident.id},
                                    child: Text(action),
                                  );
                                }).toList();
                              },
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AsylumSelection()))),
                      ),
                    )
                    .toList(),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
