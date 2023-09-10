part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  //Estado inicial
  const CounterState({ 
    this.counter =0, 
    this.transactionCount =0
  });

copyWith({
   int? counter,
   int? transactionCount,
}) => CounterState(
  counter: counter ?? this.counter,
  transactionCount: transactionCount ?? this.transactionCount
);

//Campos a considerar si dos objetos son iguales
  @override
  List<Object> get props => [counter, transactionCount];

}
