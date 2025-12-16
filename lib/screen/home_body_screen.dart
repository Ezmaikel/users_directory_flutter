import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:users_directory_flutter/screen/home_body_detail_screen.dart';
import 'package:users_directory_flutter/viewmodel/users_viewmodel.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  Widget build(BuildContext context) {
    final usersViewmodel = context.watch<UsersViewmodel>();
    if (usersViewmodel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (usersViewmodel.errorMessage != null) {
      return Center(child: Text(usersViewmodel.errorMessage!));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Introduce nombre de Usuario",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onChanged: (text) {
              usersViewmodel.searchUsers(text);
            },
          ),
        ),
        Expanded(child: listViewModel(usersViewmodel)),
      ],
    );
  }

  ListView listViewModel(UsersViewmodel usersViewmodel) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      itemCount: usersViewmodel.users.length,
      itemBuilder: (context, index) {
        final user = usersViewmodel.users[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homeBodyDetailScreen(user: user),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 16,
                      bottom: 8,
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nombre Real: ${user.name}"),
                        Text("Nombre de Usuario:${user.userName}"),
                        Text(
                          "Correo Electronico: ${user.email}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
