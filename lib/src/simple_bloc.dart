// lib/src/simple_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bloc_simple/src/state_types.dart';

// A simplified Bloc that works with SimpleState and any Event type
abstract class SimpleBloc<Event, T> extends Bloc<Event, SimpleState<T>> {
  SimpleBloc() : super(SimpleState<T>.initial()) {
    registerEventHandlers();
  }

  //Override this method to register your event handlers
  void registerEventHandlers();

  // Set loading state
  void setLoading() => emit(SimpleState<T>.loading());

  // Set success state with data
  void setSuccess(T data, {String? message}) =>
      emit(SimpleState<T>.success(data));

  // Set error state
  void setError(Exception error) =>
      emit(SimpleState<T>.error(error.toString()));

  // Execute an async operation with automatic state management
  Future<void> executeAsync(
    Future<T> Function() operation, {
    String? successMessage,
    bool emitLoadingState = true,
  }) async {
    try {
      if (emitLoadingState) setLoading();
      final result = await operation();
      setSuccess(result, message: successMessage);
    } catch (e) {
      setError(e is Exception ? e : Exception(e.toString()));
    }
  }
}
