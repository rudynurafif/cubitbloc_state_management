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
      child: BlocBuilder<CounterBloc, int>(
        bloc: myCounter,
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(fontSize: 50, color: Colors.white),
          );
        },
      ),
    );
  }
}
