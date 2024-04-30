import 'package:cubitbloc_state_management/bloc/counter.dart';
import 'package:cubitbloc_state_management/pages/basic_cubit.dart';
import 'package:cubitbloc_state_management/pages/bloc.dart';
import 'package:cubitbloc_state_management/pages/bloc_provider.dart';
import 'package:cubitbloc_state_management/pages/other_page.dart';
import 'package:cubitbloc_state_management/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = MyRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onRoute,
    );
  }
}
