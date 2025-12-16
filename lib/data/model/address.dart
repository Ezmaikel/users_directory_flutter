import 'package:users_directory_flutter/data/model/coordenadas.dart';

class UsersAddress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo? geo;

  UsersAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    this.geo,
  });

  factory UsersAddress.fromJson(Map<String, dynamic> json) {
    return UsersAddress(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
      geo: json["geo"] != null ? Geo.fromJson(json["geo"]) : null,
    );
  }
}
