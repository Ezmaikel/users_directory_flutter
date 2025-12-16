import 'dart:convert';

import 'package:users_directory_flutter/data/model/Users.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  static const _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<Users>> fetchUsers() async {
    final response = await http.get(Uri.parse("$_baseUrl/users"));
    if (response.statusCode != 200) {
      throw Exception("Error");
    }
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => Users.fromJson(e)).toList();
  }

  Future<List<Users>> searchUsers(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/users?q=$query"));
    if (response.statusCode != 200) {
      throw Exception("Error");
    }
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => Users.fromJson(e)).toList();
  }
}
