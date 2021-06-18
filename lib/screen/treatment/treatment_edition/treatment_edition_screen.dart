import 'package:amparo_app/model/requests/treatment_request.dart';
import 'package:amparo_app/model/responses/medicine.dart';
import 'package:amparo_app/model/responses/professional.dart';
import 'package:amparo_app/model/responses/resident.dart';
import 'package:amparo_app/model/responses/treatment_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../network/treatment_http_service.dart';
import '../../../model/responses/treatment.dart';
import '../../../model/enums/marital_status.dart';

class TreatmentEdit extends StatefulWidget {
  final TreatmentHttpService treatmentService = TreatmentHttpService();
  final Treatment? treatment;

  TreatmentEdit({Key? key, this.treatment}) : super(key: key);

  @override
  _TreatmentEditState createState() => _TreatmentEditState();
}

class _TreatmentEditState extends State<TreatmentEdit> {
  final GlobalKey<FormState> _treatmentFormKey = GlobalKey<FormState>();
  late Future<TreatmentOptions>? _treatmentOptions;
  late int? _residentIdValue;
  late int? _professionalIdValue;
  late List<int>? _medicineIdListValue;
  late int? _medicineCount;
  bool _callingAPI = false;

  @override
  void initState() {
    super.initState();
    _treatmentOptions = widget.treatmentService.getOptions();
    _residentIdValue = widget.treatment?.residentId;
    _professionalIdValue = widget.treatment?.responsibleProfessional.id;
    _medicineIdListValue = widget.treatment?.medicineList.map((e) => e.id).toList();
    _medicineCount = _medicineIdListValue?.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.treatment != null ? "Edição de tratamento" : "Criação de tratamento",
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1D6AFF),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: FutureBuilder(
        future: _treatmentOptions,
        builder: (BuildContext context, AsyncSnapshot<TreatmentOptions> snapshot) {
          if (snapshot.hasData) {
            TreatmentOptions? treatmentOptions = snapshot.data;
            if (treatmentOptions != null) {
              return IgnorePointer(
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
                                "Informações do Tratamento",
                                style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
                              ),
                              Form(
                                key: _treatmentFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                      child: DropdownButtonFormField<String>(
                                        value: treatmentOptions.residentList
                                            .singleWhereOrNull((element) => element.id == _residentIdValue)
                                            ?.id
                                            .toString(),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            setState(() {
                                              _residentIdValue = int.parse(newValue);
                                            });
                                          }
                                        },
                                        items: treatmentOptions.residentList
                                            .map<DropdownMenuItem<String>>((Resident resident) {
                                          return DropdownMenuItem(
                                              value: resident.id.toString(), child: Text(resident.name));
                                        }).toList(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Por favor, selecione o residente';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Residente *',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                      child: DropdownButtonFormField<String>(
                                        value: treatmentOptions.professionalList
                                            .firstWhereOrNull((element) => element.id == _professionalIdValue)
                                            ?.id
                                            .toString(),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            setState(() {
                                              _professionalIdValue = int.parse(newValue);
                                            });
                                          }
                                        },
                                        items: treatmentOptions.professionalList
                                            .map<DropdownMenuItem<String>>((Professional professional) {
                                          return DropdownMenuItem(
                                              value: professional.id.toString(), child: Text(professional.name));
                                        }).toList(),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Por favor, selecione o profissional responsável';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Profissional responsável *',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                      child: MultiSelectDialogField(
                                        initialValue: _medicineIdListValue != null && _medicineIdListValue!.isNotEmpty
                                            ? treatmentOptions.medicineList
                                                .whereIndexed(
                                                    (index, element) => element.id == _medicineIdListValue![index])
                                                .toList()
                                            : [],
                                        items: treatmentOptions.medicineList
                                            .map((medicine) => MultiSelectItem<Medicine>(medicine, medicine.name))
                                            .toList(),
                                        title: Text("Medicamentos"),
                                        selectedColor: Colors.blue,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        buttonIcon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey.shade700,
                                        ),
                                        buttonText: Text(
                                          _medicineIdListValue != null && _medicineIdListValue!.isNotEmpty
                                              ? "$_medicineCount" + " medicamento(s) selecionado(s)"
                                              : "Medicamentos *",
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 16,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Por favor, selecione o(s) medicamento(s)';
                                          }
                                          return null;
                                        },
                                        onConfirm: (results) {
                                          setState(() {
                                            List<Medicine> resultsCast = results.cast();
                                            _medicineIdListValue = resultsCast.map((e) => e.id).toList();
                                            _medicineCount = _medicineIdListValue?.length;
                                          });
                                        },
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
                                              _treatmentFormKey.currentState!.reset();
                                              setState(() {
                                                _residentIdValue = null;
                                                _professionalIdValue = null;
                                              });
                                            },
                                            child: const Text('Limpar',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white)),
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 8.0),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              if (_treatmentFormKey.currentState!.validate()) {
                                                final request = TreatmentRequest(
                                                    residentId: _residentIdValue!,
                                                    responsibleProfessionalId: _professionalIdValue!,
                                                    medicineIdList: _medicineIdListValue!);
                                                setState(() {
                                                  _callingAPI = true;
                                                });
                                                if (widget.treatment != null) {
                                                  var result = await widget.treatmentService
                                                      .update(widget.treatment!.id, request);
                                                  setState(() {
                                                    _callingAPI = false;
                                                  });
                                                  if (result) {
                                                    Navigator.of(context).pop();
                                                    _showDialog(context, "Tratamento atualizado!",
                                                        "O tratamento foi atualizado com sucesso.");
                                                  } else {
                                                    _showDialog(context, "Ocorreu um erro", "Tente salvar novamente.");
                                                  }
                                                } else {
                                                  var result = await widget.treatmentService.create(request);
                                                  setState(() {
                                                    _callingAPI = false;
                                                  });
                                                  if (result) {
                                                    Navigator.of(context).pop();
                                                    _showDialog(context, "Tratamento criado!",
                                                        "O tratamento foi criado com sucesso.");
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
                                                    style: TextStyle(
                                                        fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white)),
                                            style:
                                                ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
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
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
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
