import 'package:amparo_app/model/responses/professional.dart';
import 'package:amparo_app/network/professional_http_service.dart';
import 'package:flutter/material.dart';
import '../../../model/enums/marital_status.dart';
import '../../../model/enums/gender.dart';
import '../../../model/enums/race.dart';
import '../../../model/enums/federative_unit.dart';
import '../../../model/enums/professional_specialty.dart';
import 'package:flutter/cupertino.dart';


class ProfessionalDetail extends StatelessWidget {

  final ProfessionalHttpService service = ProfessionalHttpService();
  final Professional professional;

  ProfessionalDetail({Key? key, required this.professional}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do profissional",
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
                buildProfessionalCard(),
                buildAdressCard(),
                buildSpecialityCard()
              ],
            ),
          )
        ],
      ),

    );
  }

  Widget buildProfessionalCard() {
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
            buildHorizontalDefinition("CPF:  ", professional.cpf),
            buildHorizontalDefinition("RG:  ", professional.rg),
            buildHorizontalDefinition("Sexo:  ", professional.gender.description),
            buildHorizontalDefinition("Raça:  ", professional.race.description),
            buildHorizontalDefinition("Estado civil:  ", professional.maritalStatus.description),
            buildHorizontalDefinition("Idade:  ", professional.age.toString() + " anos"),
            buildHorizontalDefinition("Data de nascimento:  ", professional.birthDate),
            buildHorizontalDefinition("Telefone celular:  ", professional.mobilePhone),
            buildHorizontalDefinition("Telefone residencial:  ", professional.residentialPhone),
            buildHorizontalDefinition("E-mail:  ", professional.email),
          ],
        ),
      ),
    );
  }

  Widget buildAdressCard() {
    if (professional.address != null) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Endereço",
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
              buildHorizontalDefinition("Rua:  ", professional.address.streetName),
              buildHorizontalDefinition("Número:  ", professional.address.number.toString()),
              buildHorizontalDefinition("Bairro:  ", professional.address.district),
              buildHorizontalDefinition("Cidade:  ", professional.address.cityName),
              buildHorizontalDefinition("Estado:  ", professional.address.federativeUnit.toString()),
              buildHorizontalDefinition("CEP:  ", professional.address.zipCode),
              buildHorizontalDefinition("Observação:  ", professional.address.observation),

            ],
          ),
        ),
      );
    }
    return Container();
  }

  Widget buildSpecialityCard() {
    if (professional.professionalSpecialty != null) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Especialidade',
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
              buildHorizontalDefinition("Inscrição:  ", professional.register),
              buildHorizontalDefinition("Especialidade:  ", professional.professionalSpecialty.description),

            ],
          ),
        ),
      );
    }
    return Container();
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
    if (professional.nickname != null) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                (professional.socialName == null ? professional.name : professional.socialName)!,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 24.0, color: Colors.black87),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Row(
              children: [
                Text(
                  professional.nickname!,
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
                  (professional.socialName == null ? professional.name : professional.socialName)!,
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
