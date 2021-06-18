import 'package:amparo_app/model/enums/federative_unit.dart';
import 'package:amparo_app/model/enums/professional_specialty.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/enums/marital_status.dart';
import '../../../model/enums/gender.dart';
import '../../../model/enums/race.dart';
import '../../../model/requests/address_request.dart';
import '../../../model/responses/professional.dart';
import '../../../network/professional_http_service.dart';

class ProfessionalEdit extends StatefulWidget {
  final ProfessionalHttpService professionalService = ProfessionalHttpService();
  final Professional? professional;

  ProfessionalEdit({Key? key, this.professional}) : super(key: key);

  @override
  _ProfessionalEditState createState() => _ProfessionalEditState();
}

class _ProfessionalEditState extends State<ProfessionalEdit> {
  final GlobalKey<FormState> _professionalFormKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _socialNameController;
  late TextEditingController _nicknameController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late ProfessionalSpecialty? _professionalSpecialtyValue;
  late TextEditingController _registerController;
  late TextEditingController _cpfController;
  late TextEditingController _rgController;
  late Race? _raceValue;
  late Gender? _genderValue;
  late MaritalStatus? _maritalStatusValue;
  late DateTime? _birthDateValue;
  late TextEditingController _birthDateController;
  late TextEditingController _streetNameController;
  late TextEditingController _districtController;
  late TextEditingController _numberController;
  late TextEditingController _observationController;
  late TextEditingController _zipCodeController;
  late TextEditingController _cityNameController;
  late FederativeUnit? _federativeUnitValue;
  late TextEditingController _emailController;
  late TextEditingController _mobilePhoneController;
  late TextEditingController _residentialPhoneController;
  bool _callingAPI = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.professional?.name);
    _socialNameController = TextEditingController(text: widget.professional?.socialName);
    _nicknameController = TextEditingController(text: widget.professional?.nickname);
    _professionalSpecialtyValue = widget.professional?.professionalSpecialty;
    _registerController = TextEditingController(text: widget.professional?.register);
    _cpfController = TextEditingController(text: widget.professional?.cpf);
    _rgController = TextEditingController(text: widget.professional?.rg);
    _raceValue = widget.professional?.race;
    _genderValue = widget.professional?.gender;
    _maritalStatusValue = widget.professional?.maritalStatus;
    _birthDateValue = widget.professional?.birthDate != null ? DateTime.parse(widget.professional!.birthDate) : null;
    _birthDateController =
        TextEditingController(text: _birthDateValue != null ? DateFormat("dd/MM/yyyy").format(_birthDateValue!) : "");
    _streetNameController = TextEditingController(text: widget.professional?.address.streetName);
    _districtController = TextEditingController(text: widget.professional?.address.streetName);
    _numberController = TextEditingController(text: widget.professional?.address.number.toString());
    _observationController = TextEditingController(text: widget.professional?.address.observation);
    _zipCodeController = TextEditingController(text: widget.professional?.address.zipCode);
    _cityNameController = TextEditingController(text: widget.professional?.address.cityName);
    _federativeUnitValue = widget.professional?.address.federativeUnit;
    _emailController = TextEditingController(text: widget.professional?.email);
    _mobilePhoneController = TextEditingController(text: widget.professional?.mobilePhone);
    _residentialPhoneController = TextEditingController(text: widget.professional?.residentialPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _socialNameController.dispose();
    _nicknameController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  String? _validateDate() {
    if ((_birthDateValue == null)) {
      return null;
    }

    if (_birthDateValue!.year < DateTime
        .now()
        .year) {
      return null;
    } else if (_birthDateValue!.month < DateTime
        .now()
        .month) {
      return null;
    } else if (_birthDateValue!.day < DateTime
        .now()
        .day) {
      return null;
    }
    return 'Data inválida';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.professional != null ? "Edição de profissional" : "Criação de profissional",
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
                        "Informações do Residente",
                        style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
                      ),
                      Form(
                        key: _professionalFormKey,
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
                                controller: _socialNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome social',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _nicknameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Apelido',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _cpfController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o CPF';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CPF *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: TextFormField(
                                controller: _rgController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o RG';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'RG *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _raceValue?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _raceValue = Race.values.firstWhere((race) => race.description == newValue);
                                    });
                                  }
                                },
                                items: Race.values.map<DropdownMenuItem<String>>((Race race) {
                                  return DropdownMenuItem(value: race.description, child: Text(race.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira a raça';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Raça *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _genderValue?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _genderValue =
                                          Gender.values.firstWhere((gender) => gender.description == newValue);
                                    });
                                  }
                                },
                                items: Gender.values.map<DropdownMenuItem<String>>((Gender gender) {
                                  return DropdownMenuItem(value: gender.description, child: Text(gender.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o sexo';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Sexo *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: _maritalStatusValue?.description,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _maritalStatusValue = MaritalStatus.values
                                          .firstWhere((maritalStatus) => maritalStatus.description == newValue);
                                    });
                                  }
                                },
                                items:
                                MaritalStatus.values.map<DropdownMenuItem<String>>((MaritalStatus maritalStatus) {
                                  return DropdownMenuItem(
                                      value: maritalStatus.description, child: Text(maritalStatus.description));
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira o estado civil';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Estado civil *',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _birthDateController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, insira a data de nascimento';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      errorText: _validateDate(),
                                      border: OutlineInputBorder(),
                                      labelText: 'Data de nascimento *',
                                      suffixIcon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Os campos indicados com * são obrigatórios",
                              style: TextStyle(
                                  fontFamily: 'SF Pro', fontSize: 14.0, color: Colors.black87),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 12.0, right: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _professionalFormKey.currentState!.reset();
                                      setState(() {
                                        _nameController.text = "";
                                        _socialNameController.text = "";
                                        _nicknameController.text = "";
                                        _cpfController.text = "";
                                        _rgController.text = "";
                                        _raceValue = null;
                                        _genderValue = null;
                                        _maritalStatusValue = null;
                                        _birthDateValue = null;
                                        _birthDateController.text = "";
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
                                      if (_professionalFormKey.currentState!.validate()) {
                                        final addressRequest = AddressRequest(
                                            streetName: _streetNameController.text,
                                            district: _districtController.text,
                                            number: int.parse(_numberController.text),
                                            zipCode: _zipCodeController.text,
                                            cityName: _cityNameController.text,
                                            federativeUnit: _federativeUnitValue!
                                        )
                                        final request = ProfessionalRequest(
                                            name: _nameController.text,
                                            socialName:
                                            _socialNameController.text.isEmpty ? null : _socialNameController.text,
                                            nickname:
                                            _nicknameController.text.isEmpty ? null : _nicknameController.text,
                                            cpf: _cpfController.text,
                                            rg: _rgController.text,
                                            race: _raceValue!,
                                            gender: _genderValue!,
                                            maritalStatus: _maritalStatusValue!,
                                            birthDate: _birthDateValue!,
                                            );
                                        setState(() {
                                          _callingAPI = true;
                                        });
                                        if (widget.professional != null) {
                                          var result =
                                          await widget.professionalService.update(widget.professional!.id, request);
                                          setState(() {
                                            _callingAPI = false;
                                          });
                                          if (result) {
                                            Navigator.of(context).pop();
                                            _showDialog(context, "Residente atualizado!",
                                                "O residente foi atualizado com sucesso.");
                                          } else {
                                            _showDialog(context, "Ocorreu um erro", "Tente salvar novamente.");
                                          }
                                        } else {
                                          var result = await widget.professionalService.create(request);
                                          setState(() {
                                            _callingAPI = false;
                                          });
                                          if (result) {
                                            Navigator.of(context).pop();
                                            _showDialog(
                                                context, "Residente criado!", "O residente foi criado com sucesso.");
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
        initialDate: _birthDateValue ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime
            .now()
            .year + 1));
    if (picked != null && picked != _birthDateValue)
      setState(() {
        _birthDateValue = picked;
        _birthDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  _showDialog(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
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
