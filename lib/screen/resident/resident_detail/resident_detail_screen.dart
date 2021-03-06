import 'package:amparo_app/model/responses/medicine.dart';
import 'package:intl/intl.dart';

import '../../../network/resident_http_service.dart';
import '../../../model/responses/resident.dart';
import '../../../model/enums/professional_specialty.dart';
import '../../../model/enums/health_insurance_type.dart';
import '../../../model/enums/administration_route.dart';
import '../../../model/enums/quantity_type.dart';
import '../../../model/enums/frequency_type.dart';
import '../../../model/enums/marital_status.dart';
import '../../../model/enums/gender.dart';
import '../../../model/enums/race.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentDetail extends StatelessWidget {
  final ResidentHttpService service = ResidentHttpService();
  final Resident resident;

  ResidentDetail({Key? key, required this.resident}) : super(key: key);

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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildResidentCard(),
                buildHealthInsuranceCard(),
                buildResponsibleCard(),
                buildTreatmentCard(),
                buildUpdatedAndCreatedAt(),
              ],
            ),
          )
        ],
      ),
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
            buildHorizontalDefinition("Ra??a:  ", resident.race.description),
            buildHorizontalDefinition("Estado civil:  ", resident.maritalStatus.description),
            buildHorizontalDefinition("Idade:  ", resident.age.toString() + " anos"),
            buildHorizontalDefinition(
                "Data de nascimento:  ", DateFormat("dd/MM/yyyy").format(DateTime.parse(resident.birthDate))),
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
                    resident.healthInsurance.healthInsuranceType == HealthInsuranceType.SUS
                        ? "Plano de sa??de p??blico"
                        : "Plano de sa??de particular",
                    style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black38,
            ),
            buildHorizontalDefinition("Inscri????o:  ", resident.healthInsurance.inscription),
            buildHorizontalDefinition("Observa????o:  ", resident.healthInsurance.observation),
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
                    "Respons??vel",
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
              Text("??ltima atualiza????o em " + resident.updatedAt!,
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
                      "Frequ??ncia:  ",
                      "de " +
                          medicine.dosage.frequency.toString() +
                          " em " +
                          medicine.dosage.frequency.toString() +
                          " " +
                          medicine.dosage.frequencyType.description),
                  buildHorizontalDefinition("Via de administra????o:  ", medicine.dosage.administrationRoute.description),
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
    Widget? buildNickname() {
      if (resident.nickname != null) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Text(
                resident.nickname!,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
              ),
            ],
          ),
        );
      }
    }

    Widget? buildSocialName() {
      if (resident.socialName != null) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Text(
                resident.socialName!,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
              ),
            ],
          ),
        );
      }
    }

    return Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  resident.name,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
                ),
              ],
            ),
            Container(
              child: buildSocialName(),
            ),
            Container(
              child: buildNickname(),
            ),
          ],
        ));
  }
}
