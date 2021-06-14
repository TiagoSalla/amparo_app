import 'package:amparo_app/model/responses/treatment.dart';
import 'package:amparo_app/network/treatment_http_service.dart';
import 'package:amparo_app/screen/treatment/treatment_detail/treatment_detail_screen.dart';
import 'package:amparo_app/screen/treatment/treatment_edition/treatment_edition_screen.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:amparo_app/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class TreatmentList extends StatefulWidget {
  final TreatmentHttpService service = TreatmentHttpService();

  TreatmentList({Key? key}) : super(key: key);

  @override
  _TreatmentListState createState() => _TreatmentListState();
}

class _TreatmentListState extends State<TreatmentList> {
  late Future<List<Treatment>> treatmentList;

  @override
  void initState() {
    super.initState();
    treatmentList = widget.service.getTreatments();
  }

  void refreshList() {
    setState(() {
      treatmentList = widget.service.getTreatments();
    });
  }

  Future<void> _didSelectAction(Map<String, Treatment> selection) async {
    if (selection.keys.first == EDIT) {
      Navigator.of(context).push(DefaultPageRouter(widget: TreatmentEdit(treatment: selection.values.first)));
    } else if (selection.keys.first == DELETE) {
      final bool isValid = await widget.service.deleteTreatment(selection.values.first.id);

      if (isValid) {
        _showDialog(context, "Excluído com sucesso", "O tratamento foi excluído com sucesso!");

        refreshList();
      } else {
        _showDialog(context, "Falha ao excluir", "Não foi possível excluir o tratamento. Tente novamente.");
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
          TREATMENTS,
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1D6AFF),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  refreshList();
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )),
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: FutureBuilder(
        future: treatmentList,
        builder: (BuildContext context, AsyncSnapshot<List<Treatment>> snapshot) {
          if (snapshot.hasData) {
            List<Treatment>? treatments = snapshot.data;
            if (treatments != null) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                children: treatments
                    .map(
                      (Treatment treatment) => Card(
                        child: ListTile(
                            title: Text(("Residente: " + treatment.residentName)),
                            subtitle: Text(("Profissional: " + treatment.responsibleProfessional.name)),
                            trailing: PopupMenuButton(
                              tooltip: "Abrir menu de opções",
                              onSelected: _didSelectAction,
                              itemBuilder: (BuildContext context) {
                                return ACTIONS.map((String action) {
                                  return PopupMenuItem<Map<String, Treatment>>(
                                    value: {action: treatment},
                                    child: Row(
                                      children: [
                                        Padding(
                                          child: Icon(
                                            action == EDIT ? Icons.edit : Icons.delete,
                                            color: action == EDIT ? Colors.amber : Colors.redAccent,
                                            size: 20,
                                          ),
                                          padding: EdgeInsets.only(right: 8),
                                        ),
                                        Text(action)
                                      ],
                                    ),
                                  );
                                }).toList();
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              icon: Icon(Icons.more_vert),
                            ),
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => TreatmentDetail(treatment: treatment)))),
                      ),
                    )
                    .toList(),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 40.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TreatmentEdit())),
        tooltip: 'Criar um tratamento',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
