import 'package:amparo_app/model/responses/health_insurance_type.dart';
import 'package:amparo_app/model/responses/medicine.dart';
import 'package:amparo_app/network/health_insurance_http_service.dart';

import '../../../network/resident_http_service.dart';
import '../../../model/responses/resident.dart';
import '../../../model/enums/professional_specialty.dart';
import '../../../model/enums/administration_route.dart';
import '../../../model/enums/quantity_type.dart';
import '../../../model/enums/frequency_type.dart';
import '../../../model/enums/marital_status.dart';
import '../../../model/enums/gender.dart';
import '../../../model/enums/race.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentEdit extends StatefulWidget {
  final ResidentHttpService residentService = ResidentHttpService();
  final HealthInsuranceHttpService healthInsuranceService = HealthInsuranceHttpService();
  final Resident? resident;

  ResidentEdit({Key? key, this.resident}) : super(key: key);

  @override
  _ResidentEditState createState() => _ResidentEditState();
}

class _ResidentEditState extends State<ResidentEdit> {
  late Future<List<HealthInsuranceType>> healthInsuranceList;
  final nameController = TextEditingController();
  final socialNameController = TextEditingController();
  final nicknameController = TextEditingController();
  final cpfController = TextEditingController();
  final rgController = TextEditingController();

  "race": "WHITE",
  "gender": "MALE",
  "maritalStatus": "SINGLE",
  "birthDate": "string",
  "healthInsurance": {
  "healthInsuranceRawValue": "string",
  "inscription": "string",
  "observation": "string"

  @override
  void initState() {
    super.initState();
    healthInsuranceList = widget.healthInsuranceService.getHealthInsuranceTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do residente",
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1D6AFF),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Column(children: [Form],),
    );
  }

  Widget buildResidentCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildNameRows(),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            buildHorizontalDefinition("CPF:  ", resident.cpf),
            buildHorizontalDefinition("RG:  ", resident.rg),
            buildHorizontalDefinition("Sexo:  ", resident.gender.description),
            buildHorizontalDefinition("Raça:  ", resident.race.description),
            buildHorizontalDefinition("Estado civil:  ", resident.maritalStatus.description),
            buildHorizontalDefinition("Idade:  ", resident.age.toString() + " anos"),
            buildHorizontalDefinition("Data de nascimento:  ", resident.birthDate),
          ],
        ),
      ),
    );
  }

  Widget buildHealthInsuranceCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  resident.healthInsurance.healthInsuranceType.description,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Row(
                children: [
                  Text(
                    resident.healthInsurance.healthInsuranceType.rawValue == "SUS"
                        ? "Plano de saúde público"
                        : "Plano de saúde particular",
                    style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            buildHorizontalDefinition("Inscrição:  ", resident.healthInsurance.inscription),
            buildHorizontalDefinition("Observação:  ", resident.healthInsurance.observation),
          ],
        ),
      ),
    );
  }

  Widget buildTreatmentCard() {
    if (resident.treatment != null) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Tratamento",
                    style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Divider(
                  height: 1,
                  color: Colors.black38,
                ),
              ),
              buildHorizontalDefinition("Profissional:  ", resident.treatment!.responsibleProfessional.name),
              buildHorizontalDefinition(
                  "Especialidade:  ", resident.treatment!.responsibleProfessional.professionalSpecialty.description),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Divider(
                  height: 1,
                  color: Colors.black38,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Medicamentos:",
                    style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
              buildMedicines(),
            ],
          ),
        ),
      );
    }
    return Container();
  }

  Widget buildResponsibleCard() {
    if (resident.responsible != null) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Responsável",
                    style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                child: Row(
                  children: [
                    Text(
                      resident.responsible!.socialName != null
                          ? resident.responsible!.socialName!
                          : resident.responsible!.name,
                      style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black38,
              ),
              buildHorizontalDefinition("CPF:  ", resident.responsible!.cpf),
              buildHorizontalDefinition("RG:  ", resident.responsible!.rg),
              buildHorizontalDefinition("E-mail:  ", resident.responsible!.email),
              buildHorizontalDefinition("Celular:  ", resident.responsible!.mobilePhone),
              buildHorizontalDefinition("Telefone residencial:  ", resident.responsible!.residentialPhone),
            ],
          ),
        ),
      );
    }
    return Container();
  }

  Widget buildUpdatedAndCreatedAt() {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Última atualização em " + resident.updatedAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Criado em " + resident.createdAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMedicines() {
    List<Widget> col = resident.treatment!.medicineList
        .map((Medicine medicine) => Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Divider(
              height: 1,
              color: Colors.black38,
            ),
          ),
          Row(
            children: [
              Text(
                medicine.name,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 20.0, color: Colors.blueGrey),
              ),
            ],
          ),
          buildHorizontalDefinition("Quantidade:  ",
              medicine.dosage.quantity.toString() + " " + medicine.dosage.quantityType.description),
          buildHorizontalDefinition(
              "Frequência:  ",
              "de " +
                  medicine.dosage.frequency.toString() +
                  " em " +
                  medicine.dosage.frequency.toString() +
                  " " +
                  medicine.dosage.frequencyType.description),
          buildHorizontalDefinition("Via de administração:  ", medicine.dosage.administrationRoute.description),
        ],
      ),
    ))
        .toList();
    return Column(
      children: col,
    );
  }

  Widget buildHorizontalDefinition(String leftValue, String? rightValue) {
    if (rightValue != null) {
      return Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Row(
          children: [
            Text(leftValue, style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey)),
            Text(rightValue, style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.black54)),
          ],
        ),
      );
    }
    return Container();
  }

  Widget buildNameRows() {
    if (resident.nickname != null) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                (resident.socialName == null ? resident.name : resident.socialName)!,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Row(
              children: [
                Text(
                  resident.nickname!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Text(
                  (resident.socialName == null ? resident.name : resident.socialName)!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
