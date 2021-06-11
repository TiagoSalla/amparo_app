import 'dart:convert';
import 'package:http/http.dart';
import '../utils/strings/routes.dart';
import '../model/responses/resident.dart';
import '../model/requests/resident_request.dart';

class ResidentHttpService {
  var headers = {"Accept": "application/json", "content-type": "application/json"};

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

  Future<bool> create(ResidentRequest residentRequest) async {
    Response response = await post(Uri.parse(RESIDENT_PATH + CREATE_PATH),
        headers: headers, body: jsonEncode(residentRequest.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> update(int id, ResidentRequest residentRequest) async {
    var json = jsonEncode(residentRequest.toJson());
    Response response = await put(Uri.parse(RESIDENT_PATH + UPDATE_PATH + id.toString()),
        headers: headers, body: jsonEncode(residentRequest.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
