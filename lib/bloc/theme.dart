import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Cubit<bool> {
  // true (light), false (dark)
  ThemeBloc() : super(true);

  void changeTheme() => emit(!state);
}
