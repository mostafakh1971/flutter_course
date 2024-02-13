import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  CounterCubit get(context) => BlocProvider.of(context);
  int count = 0;

  increment() {
    count++;
    emit(CounterIncrementState());
  }

  minus() {
    count--;
    emit(CounterMinusState());
  }

  bool isScure = true;
  var icon = Icons.visibility;
  changeScure() {
    isScure = !isScure;
    isScure ? icon = Icons.visibility : icon = Icons.visibility_off;
    emit(ChangeScureState());
  }
}
