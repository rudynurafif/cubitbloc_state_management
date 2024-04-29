import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'center_widget.dart';
import 'counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: CentreWidget(),
    );
  }
}
