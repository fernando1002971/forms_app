import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";


part 'counter_state.dart';

//CounterCubit tiene acceso al state o estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

//Métodos que emiten nuevos estados

//1. Función que permite incrementar
  void increaseBy(int value) {
    emit(state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1));
  }

//2- Función que permita reiniciar el conteo
  void reset() {
    emit(state.copyWith(
        counter: 0,
    )
      );
  }
}
