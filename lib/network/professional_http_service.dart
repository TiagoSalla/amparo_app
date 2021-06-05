import 'dart:convert';

import 'package:amparo_app/model/login_request.dart';
import 'package:http/http.dart';
import 'package:amparo_app/utils/routes.dart';

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
}
