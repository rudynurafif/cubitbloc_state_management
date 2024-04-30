import 'package:cubitbloc_state_management/bloc/counter.dart';
import 'package:cubitbloc_state_management/pages/404.dart';
import 'package:cubitbloc_state_management/pages/bloc_provider.dart';
import 'package:cubitbloc_state_management/pages/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  final Counter myCounter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: BlocProviderPage(),
                ));
      case "/otherpage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const OtherPage(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }
}