import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int initData;

  Counter({this.initData = 0}) : super(initData);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
