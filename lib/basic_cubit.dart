import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterCubit extends Cubit<int> {
  int initialData;

  CounterCubit({this.initialData = 0}) : super(initialData);

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class BasicCubit extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(initialData: 65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Cubit",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    myCounter.kurangData();
                  },
                  child: Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () {
                    myCounter.tambahData();
                  },
                  child: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
