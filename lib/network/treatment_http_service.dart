import 'dart:convert';
import 'package:amparo_app/model/requests/treatment_request.dart';
import 'package:amparo_app/model/responses/treatment_options.dart';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';
import 'package:amparo_app/model/responses/treatment.dart';

class TreatmentHttpService {
  final Map<String, String> headers = {"Accept": "application/json", "content-type": "application/json"};

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

  Future<TreatmentOptions> getOptions() async {
    Response response = await get(Uri.parse(TREATMENT_PATH + OPTIONS_PATH));

    if (response.statusCode == 200) {
      var body = json.decode(utf8.decode(response.bodyBytes));
      TreatmentOptions treatmentOptions = TreatmentOptions.fromJson(body);
      return treatmentOptions;
    } else {
      throw Exception('Failed to load treatment options');
    }
  }

  Future<bool> deleteTreatment(int id) async {
    Response response = await delete(Uri.parse(TREATMENT_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> create(TreatmentRequest treatmentRequest) async {
    Response response = await post(Uri.parse(TREATMENT_PATH + CREATE_PATH),
        headers: headers, body: jsonEncode(treatmentRequest.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int id, TreatmentRequest treatmentRequest) async {
    Response response = await put(Uri.parse(TREATMENT_PATH + UPDATE_PATH + id.toString()),
        headers: headers, body: jsonEncode(treatmentRequest.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
