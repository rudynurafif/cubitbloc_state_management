import 'package:cubitbloc_state_management/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.dart';

class CentreWidget extends StatelessWidget {
  const CentreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    CounterBloc myCounter = context.read<CounterBloc>();

    return Center(
      child: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, bool>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tema dark aktif'),
                duration: Duration(seconds: 1),
              ));
            },
            listenWhen: (previous, current) {
              if (current == false) {
                return true;
              } else {
                return false;
              }
            },
          ),
          BlocListener<CounterBloc, int>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Di atas 10'),
                duration: Duration(seconds: 1),
              ));
            },
            listenWhen: (previous, current) {
              if (current > 10) {
                return true;
              } else {
                return false;
              }
            },
          ),
        ],
        child: BlocBuilder<CounterBloc, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 50, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
