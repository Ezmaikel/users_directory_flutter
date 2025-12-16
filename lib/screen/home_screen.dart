import 'package:flutter/material.dart';
import 'package:users_directory_flutter/screen/home_body_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DIRECTORIO DE USUARIOS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: HomeBodyScreen(),
    );
  }
}
