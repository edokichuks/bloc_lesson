import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitInitial(0,false));

  void increament() => emit(CounterCubitState(state.counterValue + 1, true));
  void decrement() => emit(CounterCubitState(state.counterValue - 1,false));
}
