import '../requests/address_request.dart';
import 'address_request.dart';

class ResponsibleRequest {
  final String name;
  final String? socialName;
  final String cpf;
  final String rg;
  final AddressRequest addressRequest;
  final String email;
  final String mobilePhone;
  final String? residentialPhone;
  final int residentId;

  ResponsibleRequest({
    required this.name,
    this.socialName,
    required this.cpf,
    required this.rg,
    required this.addressRequest,
    required this.email,
    required this.mobilePhone,
    this.residentialPhone,
    required this.residentId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'socialName': socialName,
      'cpf': cpf,
      'rg': rg,
      'addressRequest': addressRequest.toJson(),
      'email': email,
      'mobilePhone': mobilePhone,
      'residentialPhone': residentialPhone,
      'residentId': residentId
    };
  }
}
