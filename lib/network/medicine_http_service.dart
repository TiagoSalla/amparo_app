import 'dart:convert';
import 'package:amparo_app/model/responses/medicine.dart';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';

class MedicineHttpService {
  Future<List<Medicine>> getMedicines() async {
    Response response = await get(Uri.parse(MEDICINE_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<Medicine> medicines = List<Medicine>.from(body.map((model) => Medicine.fromJson(model)));
      return medicines;
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  Future<bool> deleteMedicine(int id) async {
    Response response = await delete(Uri.parse(MEDICINE_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
