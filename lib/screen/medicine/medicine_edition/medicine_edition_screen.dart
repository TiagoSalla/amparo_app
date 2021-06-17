import 'package:amparo_app/model/enums/administration_route.dart';
import 'package:amparo_app/model/enums/frequency_type.dart';
import 'package:amparo_app/model/requests/dosage_request.dart';
import 'package:amparo_app/model/responses/medicine.dart';
import 'package:amparo_app/network/medicine_http_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineEdit extends StatefulWidget {

  final MedicineHttpService medicineService = MedicineHttpService();
  final Medicine? medicine;

  MedicineEdit({Key? key, this.medicine}) : super(key: key);

  @override
  _MedicineEditState createState() => _MedicineEditState();
}

class _MedicineEditState extends State<MedicineEdit> {

  final GlobalKey<FormState> _medicineFormKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _laboratoryController;
  late TextEditingController _quantityController;
  late TextEditingController _quantityTypeController;
  late TextEditingController _frequencyController;
  late TextEditingController _administrationRouteController;
  late DateTime? _dueDateValue;
  late TextEditingController _dueDateController;
  late bool? _statusController;
  bool _callingAPI = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.medicine?.name);
    _laboratoryController = TextEditingController(text: widget.medicine?.laboratory);
    _quantityController = TextEditingController(text: widget.medicine?.dosage.quantity.toString());
    _quantityTypeController = TextEditingController(text: widget.medicine?.dosage.quantityType.toString());
    _frequencyController = TextEditingController(text: widget.medicine?.dosage.frequencyType.description);
    _administrationRouteController = TextEditingController(text: widget.medicine?.dosage.administrationRoute.description);
    _dueDateValue = widget.medicine?.dueDate != null ? DateTime.parse(widget.medicine!.dueDate) : null;
    _dueDateController =
        TextEditingController(text: _dueDateValue != null ? DateFormat("dd/MM/yyyy").format(_dueDateValue!) : "");
    _statusController= widget.medicine?.statusActive;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _laboratoryController.dispose();
    _quantityController.dispose();
    _quantityTypeController.dispose();
    _frequencyController.dispose();
    _administrationRouteController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  String? _validateDate() {
    if ((_dueDateValue == null)) {
      return null;
    }

    if (_dueDateValue!.year > DateTime.now().year) {
      return 'Data inválida';
    } else if (_dueDateValue!.month > DateTime.now().month) {
      return 'Data inválida';
    } else if (_dueDateValue!.day > DateTime.now().day) {
      return 'Data inválida';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.medicine != null ? "Edição de medicamento" : "Criação de medicamento",
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1D6AFF),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),

      body: IgnorePointer(
        ignoring: _callingAPI,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informações do Medicamento",
                        style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
                      ),
                      Form(
                        key: _medicineFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _nameController,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o nome';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome *',
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _laboratoryController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o laboratório';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Laboratório *',
                                ),
                              ),
                            ),


                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _quantityController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira a Quantidade';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Quantidade *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _quantityTypeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o laboratório';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Laboratório *',
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _laboratoryController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o laboratório';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Laboratório *',
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
