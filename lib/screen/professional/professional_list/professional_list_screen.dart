import 'package:amparo_app/components/drawer/custom_drawer.dart';
import 'package:amparo_app/model/responses/professional.dart';
import 'package:amparo_app/network/professional_http_service.dart';
import 'package:amparo_app/screen/professional/professional_detail/professional_detail_screen.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:flutter/material.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

class ProfessionalList extends StatefulWidget {

  final ProfessionalHttpService service = ProfessionalHttpService();

  ProfessionalList({Key? key}) : super(key: key);


  @override
  _ProfessionalListState createState() => _ProfessionalListState();
}

class _ProfessionalListState extends State<ProfessionalList> with RouteAware, RouteObserverMixin {
  late Future<List<Professional>>? professionalList;

  @override
  void initState() {
    super.initState();
    professionalList = widget.service.getProfessionals();
  }

  void refreshList() {
    setState(() {
      professionalList = widget.service.getProfessionals();
    });
  }

  @override
  void didPopNext() {
    setState(() {
      professionalList = null;
      professionalList = widget.service.getProfessionals();
    });
  }

  Future<void> _didSelectAction(Map<String, int> selection) async {
    if (selection.keys.first == EDIT) {
      Navigator.of(context).push(DefaultPageRouter(widget: ProfessionalList()));
    } else if (selection.keys.first == DELETE) {
      final bool isValid = await widget.service.deleteProfessional(selection.values.first);

      if (isValid) {
        _showDialog(context, "Excluído com sucesso", "O profissional foi excluído com sucesso!");

        refreshList();
      } else {
        _showDialog(context, "Falha ao excluir", "Não foi possível excluir o profissional. Tente novamente.");
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
          PROFESSIONALS,
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
        future: professionalList,
        builder: (BuildContext context, AsyncSnapshot<List<Professional>> snapshot) {
          if (snapshot.hasData) {
            List<Professional>? professionals = snapshot.data;
            if (professionals != null) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                children: professionals
                    .map(
                      (Professional professional) => Card(
                    child: ListTile(
                        title: Text(professional.name),
                        trailing: PopupMenuButton(
                          tooltip: "Abrir menu de opções",
                          onSelected: _didSelectAction,
                          itemBuilder: (BuildContext context) {
                            return ACTIONS.map((String action) {
                              return PopupMenuItem<Map<String, int>>(
                                value: {action: professional.id},
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
                            .push(MaterialPageRoute(builder: (context) => ProfessionalDetail(professional: professional)))
                    ),
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
        onPressed: () => setState(() => print("professional")),
        tooltip: 'Criar um profissional',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
