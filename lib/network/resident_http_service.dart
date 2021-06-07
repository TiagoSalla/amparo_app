import 'dart:convert';
import 'package:http/http.dart';
import 'package:amparo_app/utils/strings/routes.dart';
import 'package:amparo_app/model/responses/resident.dart';

class ResidentHttpService {
  Future<List<Resident>> getResidents() async {
    Response response = await get(Uri.parse(RESIDENT_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(utf8.decode(response.bodyBytes));
      List<Resident> residents = List<Resident>.from(body.map((model) => Resident.fromJson(model)));
      return residents;
    } else {
      throw Exception('Failed to load residents');
    }
  }

  Future<bool> deleteResident(int id) async {
    Response response = await delete(Uri.parse(RESIDENT_PATH + DELETE_PATH + id.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
