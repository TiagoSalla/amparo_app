import 'dart:convert';
import 'package:amparo_app/model/responses/health_insurance_type.dart';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';

class HealthInsuranceHttpService {
  Future<List<HealthInsuranceType>> getHealthInsuranceTypes() async {
    Response response = await get(Uri.parse(HEALTH_INSURANCE_PATH + TYPES_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<HealthInsuranceType> healthInsuranceTypes =
          List<HealthInsuranceType>.from(body.map((model) => HealthInsuranceType.fromJson(model)));
      return healthInsuranceTypes;
    } else {
      throw Exception('Failed to load residents');
    }
  }
}
