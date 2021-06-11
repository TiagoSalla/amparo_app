import 'package:amparo_app/model/responses/medicine.dart';
import 'package:amparo_app/network/medicine_http_service.dart';
import 'package:flutter/material.dart';

import '../../../model/enums/administration_route.dart';


class MedicineDetail extends StatelessWidget {

  final MedicineHttpService service = MedicineHttpService();
  final Medicine medicine;

  MedicineDetail({Key? key, required this.medicine}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do medicamento",
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
                buildMedicineCard(),
                buildUpdatedAndCreatedAt()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMedicineCard() {

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
            buildHorizontalDefinition("Laboratório:  ", medicine.laboratory),
            buildHorizontalDefinition("Via de Administração:  ", medicine.dosage.administrationRoute.description),
            buildHorizontalDefinition("Data de Validade:  ", medicine.dueDate),
            _status(),

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
              Text("Última atualização em " + medicine.updatedAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Criado em " + medicine.createdAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
        ],
      ),
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
              medicine.name,
              style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
            ),
          ],
        ),

      ],
    );
  }

  _status(){
    var status = medicine.statusActive.toString();

    if (status == 'true'){
      return buildHorizontalDefinition('Status: ', 'Ativo');
    } else{
      return buildHorizontalDefinition('Status: ', 'Inativo');
    }
  }



}
