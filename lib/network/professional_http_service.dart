import 'dart:convert';

import 'package:amparo_app/model/requests/login_request.dart';
import 'package:amparo_app/model/responses/professional.dart';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';

class ProfessionalHttpService {
  var headers = {"Accept": "application/json", "content-type": "application/json"};

  Future<bool> login(String username, String password) async {
    final LoginRequest request = LoginRequest(username: username, password: password);
    Response response =
        await post(Uri.parse(PROFESSIONAL_PATH + LOGIN_PATH), headers: headers, body: jsonEncode(request.toJson()));

    if (response.statusCode == 202) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Professional>> getProfessionals() async {
    Response response = await get(Uri.parse(PROFESSIONAL_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<Professional> professionals = List<Professional>.from(body.map((model) => Professional.fromJson(model)));
      return professionals;
    } else {
      throw Exception('Failed to load professionals');
    }
  }

  Future<bool> deleteProfessional(int id) async {
    Response response = await delete(Uri.parse(PROFESSIONAL_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
