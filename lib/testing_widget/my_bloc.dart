// Example: Counter using SimpleCubit
import '../src/simple_cubit.dart';

class CounterCubit extends SimpleCubit<int> {
  CounterCubit() : super() {
    // Initialize with 0
    setSuccess(0);
  }

  void increment() {
    final currentValue = state.data ?? 0;
    setSuccess(currentValue + 1);
  }

  void decrement() {
    final currentValue = state.data ?? 0;
    setSuccess(currentValue - 1);
  }
}
