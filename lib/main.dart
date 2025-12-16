import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:users_directory_flutter/data/repository/users_repository.dart';
import 'package:users_directory_flutter/screen/home_screen.dart';
import 'package:users_directory_flutter/viewmodel/users_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersViewmodel(UsersRepository())..loadUsers(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
