import 'package:amparo_app/model/responses/medicine.dart';
import 'package:amparo_app/model/responses/responsible.dart';
import 'package:amparo_app/network/responsible_http_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsibleDetail extends StatelessWidget {
  final ResponsibleHttpService service = ResponsibleHttpService();
  final Responsible responsible;

  ResponsibleDetail({Key? key, required this.responsible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do responsável",
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
                buildResponsibleCard(),
                buildResidentCard(),
                buildUpdatedAndCreatedAt(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildResponsibleCard() {
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
            buildHorizontalDefinition("CPF:  ", responsible.cpf),
            buildHorizontalDefinition("RG:  ", responsible.rg),
            buildHorizontalDefinition("Endereço:  ", responsible.address.streetName + ", " + responsible.address.number.toString()),
            buildHorizontalDefinition("Bairro:  ", responsible.address.district),
            buildHorizontalDefinition("Cidade:  ", responsible.address.cityName),
            buildHorizontalDefinition("CEP:  ", responsible.address.zipCode),
            buildHorizontalDefinition("Email:  ", responsible.email),
            buildHorizontalDefinition("Telefone:  ", responsible.mobilePhone),
            buildHorizontalDefinition("Telefone residencial:  ", responsible.residentialPhone),
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
              Text("Última atualização em " + responsible.updatedAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Criado em " + responsible.createdAt!,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 12.0, color: Colors.black54))
            ],
          ),
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
            Row(
              children: [
                Text(
                  "Residente",
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
            buildHorizontalDefinition("Nome:  ", responsible.residentName),
          ],
        ),
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
                (responsible.socialName == null ? responsible.name : responsible.socialName)!,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Row(
              children: [
                Text(
                  responsible.name,
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
