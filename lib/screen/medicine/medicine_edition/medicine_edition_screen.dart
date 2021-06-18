import 'package:amparo_app/model/enums/administration_route.dart';
import 'package:amparo_app/model/enums/frequency_type.dart';
import 'package:amparo_app/model/enums/quantity_type.dart';
import 'package:amparo_app/model/requests/dosage_request.dart';
import 'package:amparo_app/model/requests/medicine_request.dart';
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
  late QuantityType? _quantityTypeValue;
  late TextEditingController _frequencyController;
  late FrequencyType? _frequencyType;
  late AdministrationRoute? _administrationRouteValue;
  late DateTime? _dueDateValue;
  late TextEditingController _dueDateController;
  late bool? _statusValue;
  bool _callingAPI = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.medicine?.name);
    _laboratoryController = TextEditingController(text: widget.medicine?.laboratory);
    _quantityController = TextEditingController(text: widget.medicine?.dosage.quantity.toString());
    _quantityTypeValue = widget.medicine?.dosage.quantityType;
    _frequencyController = TextEditingController(text: widget.medicine?.dosage.frequency.toString());
    _frequencyType = widget.medicine?.dosage.frequencyType;
    _administrationRouteValue = widget.medicine?.dosage.administrationRoute;
    _dueDateValue = widget.medicine?.dueDate != null ? DateTime.parse(widget.medicine!.dueDate) : null;
    _dueDateController =
        TextEditingController(text: _dueDateValue != null ? DateFormat("dd/MM/yyyy").format(_dueDateValue!) : "");
    _statusValue = widget.medicine?.statusActive;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _laboratoryController.dispose();
    _quantityController.dispose();
    _frequencyController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  String? _validateDate() {
    if ((_dueDateValue == null)) {
      return null;
    }

    if (_dueDateValue!.year > DateTime.now().year) {
      return null;
    } else if (_dueDateValue!.month > DateTime.now().month) {
      return null;
    } else if (_dueDateValue!.day > DateTime.now().day) {
      return null;
    }
    return 'Data inválida';
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
                                    return 'Por favor, insira a quantidade';
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
                              child: DropdownButtonFormField<String>(
                                value: _quantityTypeValue?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _quantityTypeValue = QuantityType.values
                                          .firstWhere((quantityType) => quantityType.description == newValue);
                                    });
                                  }
                                },
                                items: QuantityType.values.map<DropdownMenuItem<String>>((QuantityType quantityType) {
                                  return DropdownMenuItem(
                                      value: quantityType.description, child: Text(quantityType.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o tipo da quantidade';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Tipo da Quantidade *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _frequencyController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira a frequência';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Frequência *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _frequencyType?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _frequencyType = FrequencyType.values
                                          .firstWhere((frequencyType) => frequencyType.description == newValue);
                                    });
                                  }
                                },
                                items:
                                    FrequencyType.values.map<DropdownMenuItem<String>>((FrequencyType frequencyType) {
                                  return DropdownMenuItem(
                                      value: frequencyType.description, child: Text(frequencyType.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o tipo da frequência';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Tipo da Frequência *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _administrationRouteValue?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _administrationRouteValue = AdministrationRoute.values.firstWhere(
                                          (administrationRoute) => administrationRoute.description == newValue);
                                    });
                                  }
                                },
                                items: AdministrationRoute.values
                                    .map<DropdownMenuItem<String>>((AdministrationRoute administratioRoute) {
                                  return DropdownMenuItem(
                                      value: administratioRoute.description,
                                      child: Text(administratioRoute.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira a via de administração';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Via de Administração *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _dueDateController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, insira a data de vencimento';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorText: _validateDate(),
                                      border: OutlineInputBorder(),
                                      labelText: 'Data de vencimento *',
                                      suffixIcon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _statusValue != null && _statusValue == true ? "Ativo" : "Inativo",
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _statusValue = newValue == "Ativo" ? true : false;
                                    });
                                  }
                                },
                                items: ["Ativo", "Inativo"].map<DropdownMenuItem<String>>((String active) {
                                  return DropdownMenuItem(value: active, child: Text(active));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o status';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Status *',
                                ),
                              ),
                            ),
                            Text(
                              "Os campos indicados com * são obrigatórios",
                              style: TextStyle(fontFamily: 'SF Pro', fontSize: 14.0, color: Colors.black87),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 12.0, right: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _medicineFormKey.currentState!.reset();
                                      setState(() {
                                        _nameController.text = "";
                                        _laboratoryController.text = "";
                                        _quantityController.text = "";
                                        _quantityTypeValue = null;
                                        _frequencyController.text = "";
                                        _frequencyType = null;
                                        _administrationRouteValue = null;
                                        _dueDateController.text = "";
                                        _dueDateValue = null;
                                        _statusValue = null;
                                      });
                                    },
                                    child: const Text('Limpar',
                                        style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white)),
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_medicineFormKey.currentState!.validate()) {
                                        final dosageRequest = DosageRequest(
                                            quantity: int.parse(_quantityController.text),
                                            quantityType: _quantityTypeValue!,
                                            frequency: int.parse(_frequencyController.text),
                                            frequencyType: _frequencyType!,
                                            administrationRoute: _administrationRouteValue!);
                                        final request = MedicineRequest(
                                            name: _nameController.text,
                                            dosage: dosageRequest,
                                            laboratory: _laboratoryController.text,
                                            dueDate: _dueDateValue!,
                                            statusActive: _statusValue!);
                                        setState(() {
                                          _callingAPI = true;
                                        });
                                        if (widget.medicine != null) {
                                          var result =
                                              await widget.medicineService.update(widget.medicine!.id, request);
                                          setState(() {
                                            _callingAPI = false;
                                          });
                                          if (result) {
                                            Navigator.of(context).pop();
                                            _showDialog(context, "Medicamento atualizado!",
                                                "O medicamento foi atualizado com sucesso.");
                                          } else {
                                            _showDialog(context, "Ocorreu um erro", "Tente salvar novamente.");
                                          }
                                        } else {
                                          var result = await widget.medicineService.create(request);
                                          setState(() {
                                            _callingAPI = false;
                                          });
                                          if (result) {
                                            Navigator.of(context).pop();
                                            _showDialog(context, "Medicamento criado!",
                                                "O medicamento foi criado com sucesso.");
                                          } else {
                                            _showDialog(context, "Ocorreu um erro!", "Tente salvar novamente.");
                                          }
                                        }
                                      }
                                    },
                                    child: _callingAPI
                                        ? Container(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(),
                                          )
                                        : Text('Salvar',
                                            style:
                                                TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white)),
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                                  ),
                                ),
                              ],
                            )
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

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _dueDateValue ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 100));
    if (picked != null && picked != _dueDateValue)
      setState(() {
        _dueDateValue = picked;
        _dueDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  _showDialog(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          TextButton(
            onPressed: () => {Navigator.pop(context, 'OK')},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
