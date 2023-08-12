part of 'counter_cubit_cubit.dart';

@immutable
class CounterCubitState {
  final int counterValue;
  final bool wasIncreamented;

  CounterCubitState(this.counterValue, this.wasIncreamented);
}
// @immutable
// sealed class CounterCubitState {
//   // int counterValue;
//   // CounterCubitCubit(this.)
// }

final class CounterCubitInitial extends CounterCubitState {
  CounterCubitInitial(super.counterValue, super.wasIncreamented, );
}
