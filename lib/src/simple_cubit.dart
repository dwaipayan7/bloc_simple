import 'package:bloc/bloc.dart';
import 'package:bloc_simple/src/state_types.dart';

class SimpleCubit<T> extends Cubit<SimpleState<T>> {
  SimpleCubit() : super(SimpleState<T>.initial());

  //set the loading
  void setLoading() => emit(SimpleState<T>.loading());

  //set the success state
  void setSuccess(T data) => emit(SimpleState<T>.success(data));

  //void setError state
  void setError(String errorMessage) =>
      emit(SimpleState<T>.error(errorMessage));

  //For the async await responses

  Future<void> executeAsync(
    Future<T> Function() operation, {
    String? successMessage,
    bool emitLoadingState = true,
  }) async {
    if (emitLoadingState) {
      setLoading();
    }
    try {
      final data = await operation();
      setSuccess(data);
    } catch (e) {
      setError(e.toString());
    }
  }
}
