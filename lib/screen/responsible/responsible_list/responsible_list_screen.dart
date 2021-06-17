import 'package:amparo_app/model/responses/responsible.dart';
import 'package:amparo_app/network/responsible_http_service.dart';
import 'package:amparo_app/screen/asylum_selection/asylum_selection_screen.dart';
import 'package:amparo_app/screen/responsible/responsible_detail/responsible_detail_screen.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:amparo_app/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class ResponsibleList extends StatefulWidget {
  final ResponsibleHttpService service = ResponsibleHttpService();

  ResponsibleList({Key? key}) : super(key: key);

  @override
  _ResponsibleListState createState() => _ResponsibleListState();
}

class _ResponsibleListState extends State<ResponsibleList> {
  late Future<List<Responsible>> responsibleList;

  @override
  void initState() {
    super.initState();
    responsibleList = widget.service.getResponsibles();
  }

  void refreshList() {
    setState(() {
      responsibleList = widget.service.getResponsibles();
    });
  }

  Future<void> _didSelectAction(Map<String, int> selection) async {
    if (selection.keys.first == EDIT) {
      Navigator.of(context).push(DefaultPageRouter(widget: ResponsibleList()));
    } else if (selection.keys.first == DELETE) {
      final bool isValid = await widget.service.deleteResponsible(selection.values.first);

      if (isValid) {
        _showDialog(context, "Excluído com sucesso", "O responsável foi excluído com sucesso!");

        refreshList();
      } else {
        _showDialog(context, "Falha ao excluir", "Não foi possível excluir o responsável. Tente novamente.");
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
          RESPONSIBLES,
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
        future: responsibleList,
        builder: (BuildContext context, AsyncSnapshot<List<Responsible>> snapshot) {
          if (snapshot.hasData) {
            List<Responsible>? responsibles = snapshot.data;
            if (responsibles != null) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                children: responsibles
                    .map(
                      (Responsible responsible) => Card(
                        child: ListTile(
                            title: Text((responsible.socialName == null ? responsible.name : responsible.socialName)!),
                            trailing: PopupMenuButton(
                              tooltip: "Abrir menu de opções",
                              onSelected: _didSelectAction,
                              itemBuilder: (BuildContext context) {
                                return ACTIONS.map((String action) {
                                  return PopupMenuItem<Map<String, int>>(
                                    value: {action: responsible.id},
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
                                .push(MaterialPageRoute(builder: (context) => ResponsibleDetail(responsible: responsible)))),
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
        onPressed: () => setState(() => print("oi")),
        tooltip: 'Criar um responsável',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
