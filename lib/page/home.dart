import 'package:cubitbloc_state_management/bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Extension method
      1. context.read() -> biasanya digunakan didalam function
      2. context.watch() -> digunakan setiap ada perubahan state
      3. context.select()
    */

    UserBloc userBloc = context.read<UserBloc>(); // Membaca sekali
    // UserBloc userBloc = context.watch<UserBloc>(); // Membaca berulang kali setiap ada perubahan state pada bloc

    // Membaca berulang kali setiap ada perubahan state pada bloc
    String nameUser = context.select<UserBloc, String>((value) => value.state["name"]);
    int ageUser = context.select<UserBloc, int>((value) => value.state["age"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text("Nama : $nameUser"),
          Text("Umur : $ageUser"),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => userBloc.changeName(value),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] - 1);
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] + 1);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
