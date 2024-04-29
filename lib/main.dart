import 'package:cubitbloc_state_management/bloc/counter.dart';
import 'package:cubitbloc_state_management/pages/basic_cubit.dart';
import 'package:cubitbloc_state_management/pages/bloc.dart';
import 'package:cubitbloc_state_management/pages/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        home: BlocProviderPage(),
      ),
    );
  }
}
