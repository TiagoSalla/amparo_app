import 'dart:convert';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';
import 'package:amparo_app/model/responses/treatment.dart';

class TreatmentHttpService {
  Future<List<Treatment>> getTreatments() async {
    Response response = await get(Uri.parse(TREATMENT_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<Treatment> treatments = List<Treatment>.from(body.map((model) => Treatment.fromJson(model)));
      return treatments;
    } else {
      throw Exception('Failed to load treatments');
    }
  }

  Future<bool> deleteTreatment(int id) async {
    Response response = await delete(Uri.parse(TREATMENT_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
