import 'package:users_directory_flutter/data/model/address.dart';

class Users {
  final int id;
  final String name;
  final String userName;
  final String email;
  final UsersAddress? address;

  Users({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.address,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json["id"],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      address: json['address'] != null
          ? UsersAddress.fromJson(json['address'])
          : null,
    );
  }
}
