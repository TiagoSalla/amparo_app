import 'dart:convert';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';
import 'package:amparo_app/model/responses/responsible.dart';

class ResponsibleHttpService {
  Future<List<Responsible>> getResponsibles() async {
    Response response = await get(Uri.parse(RESPONSIBLE_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<Responsible> residents = List<Responsible>.from(body.map((model) => Responsible.fromJson(model)));
      return residents;
    } else {
      throw Exception('Failed to load responsibles');
    }
  }

  Future<bool> deleteResponsible(int id) async {
    Response response = await delete(Uri.parse(RESPONSIBLE_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
