import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterCubit extends Cubit<int> {
  int initialData;

  int? current;
  int? next;

  CounterCubit({this.initialData = 0}) : super(initialData);

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Bloc fitur untuk memantau perubahan data atau state

  // onChange
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  // onError
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

class BasicCubit extends StatelessWidget {
  CounterCubit myCounter = CounterCubit();

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
          SizedBox(
            height: 30,
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
