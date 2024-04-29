import 'package:cubitbloc_state_management/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bloc Listener",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener(
            bloc: mycounter,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sudah mencapai 15"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current is int && current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            child: BlocBuilder<Counter, int>(
              bloc: mycounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    mycounter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    mycounter.increment();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
