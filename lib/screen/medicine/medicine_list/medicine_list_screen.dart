import 'package:amparo_app/components/drawer/custom_drawer.dart';
import 'package:amparo_app/utils/page_routers/default_page_router.dart';
import 'package:amparo_app/utils/strings/texts.dart';
import 'package:amparo_app/network/medicine_http_service.dart';
import 'package:amparo_app/model/responses/medicine.dart';
import 'package:flutter/material.dart';

class MedicineList extends StatefulWidget {

  final MedicineHttpService service = MedicineHttpService();

  MedicineList({Key? key}) : super(key: key);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList>{
  late Future<List<Medicine>> medicineList;

  @override
  void initState() {
    super.initState();
    medicineList = widget.service.getMedicines();
  }

  void refreshList() {
    setState(() {
      medicineList = widget.service.getMedicines();
    });
  }

  Future<void> _didSelectAction(Map<String, int> selection) async {
    if (selection.keys.first == EDIT) {
      Navigator.of(context).push(DefaultPageRouter(widget: MedicineList()));
    } else if (selection.keys.first == DELETE) {
      final bool isValid = await widget.service.deleteMedicine(selection.values.first);

      if (isValid) {
        _showDialog(context, "Excluído com sucesso", "O medicamento foi excluído com sucesso!");

        refreshList();
      } else {
        _showDialog(context, "Falha ao excluir", "Não foi possível excluir o medicamento. Tente novamente.");
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
          MEDICINES,
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
        future: medicineList,
        builder: (BuildContext context, AsyncSnapshot<List<Medicine>> snapshot) {
          if (snapshot.hasData) {
            List<Medicine>? medicines = snapshot.data;
            if (medicines != null) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                children: medicines
                    .map(
                      (Medicine medicine) => Card(
                    child: ListTile(
                        title: Text(medicine.name),
                        trailing: PopupMenuButton(
                          tooltip: "Abrir menu de opções",
                          onSelected: _didSelectAction,
                          itemBuilder: (BuildContext context) {
                            return ACTIONS.map((String action) {
                              return PopupMenuItem<Map<String, int>>(
                                value: {action: medicine.id},
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
                        /*onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Medicine(resident: resident)))*/),
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


