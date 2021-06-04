import 'dart:convert';
import 'package:http/http.dart';
import 'package:amparo_app/utils/routes.dart';
import 'package:amparo_app/model/resident.dart';

class ResidentHttpService {
  Future<List<Resident>> getResidents() async {
    Response response = await get(Uri.parse(RESIDENT_PATH));

    if (response.statusCode == 200) {
      Iterable body = json.decode(response.body);
      List<Resident> residents = List<Resident>.from(body.map((model) => Resident.fromJson(model)));
      return residents;
    } else {
      throw Exception('Failed to load residents');
    }
  }
}
