import 'package:amparo_app/model/responses/medicine.dart';

import '../../../network/treatment_http_service.dart';
import '../../../model/enums/professional_specialty.dart';
import '../../../model/responses/treatment.dart';
import '../../../model/enums/administration_route.dart';
import '../../../model/enums/quantity_type.dart';
import '../../../model/enums/frequency_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreatmentDetail extends StatelessWidget {
  final TreatmentHttpService service = TreatmentHttpService();
  final Treatment treatment;

  TreatmentDetail({Key? key, required this.treatment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do tratamento",
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
            Row(
              children: [
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Divider(
                height: 1,
                color: Colors.black38,
              ),
            ),
            buildHorizontalDefinition("Profissional:  ", treatment.responsibleProfessional.name),
            buildHorizontalDefinition(
                "Especialidade:  ",
                treatment.responsibleProfessional.professionalSpecialty.description),
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

  Widget buildUpdatedAndCreatedAt() {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Última atualização em " + treatment.updatedAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Criado em " + treatment.createdAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMedicines() {
    List<Widget> col = treatment.medicineList
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
      return Column(
        children: [
          Row(
            children: [
              Text(
                (treatment.residentName == null ? treatment.residentName : treatment.residentName),
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
              ),
            ],
          ),
        ],
      );
  }
}