import 'package:cubitbloc_state_management/bloc/counter.dart';
import 'package:cubitbloc_state_management/bloc/theme.dart';
import 'package:cubitbloc_state_management/pages/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = BlocProvider.of<CounterBloc>(context);
    ThemeBloc myTheme = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bloc Provider",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed("/otherpage");
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTheme.changeTheme();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // button -
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    myCounter.decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // data widget
              DataWidget(),

              // button +
              Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    myCounter.increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
