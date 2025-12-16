import 'package:flutter/material.dart';
import 'package:users_directory_flutter/data/model/Users.dart';
import 'package:users_directory_flutter/data/repository/users_repository.dart';

class UsersViewmodel extends ChangeNotifier {
  final UsersRepository repository;

  UsersViewmodel(this.repository);

  List<Users> _allUsers = [];
  List<Users> users = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _allUsers = await repository.fetchUsers();
      users = List.from(_allUsers);
      if (users.isEmpty) {
        errorMessage = "No hay USUARIOS";
      }
    } catch (e) {
      errorMessage = "Error al cargar usuarios";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  void searchUsers(String query) async {
    if (query.trim().isEmpty) {
      users = List.from(_allUsers);
    } else {
      users = _allUsers.where((user) {
        final q = query.toLowerCase();
        return user.name.toLowerCase().contains(q) ||
            user.userName.toLowerCase().contains(q);
      }).toList();
    }
    notifyListeners();
  }
}
