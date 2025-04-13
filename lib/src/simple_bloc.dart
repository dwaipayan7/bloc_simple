import 'package:bloc/bloc.dart';
import 'package:bloc_simple/src/state_types.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SimpleBloc<Event, T> extends Bloc<Event, SimpleState<T>> {
  SimpleBloc() : super(SimpleState<T>.initial()) {
    registerEventHandlers();
  }

  //Override the event handler

  void registerEventHandlers();

  //setLoading State
  void setLoading() => emit(SimpleState<T>.loading());

  //set the success state
  void setSuccess(T data) => emit(SimpleState<T>.success(data));

  //error message
  void setError(String errorMessage) =>
      emit(SimpleState<T>.error(errorMessage));

  //Future implementation

  Future<void> executeAsync(
    Future<T> Function() operations, {
    String? successMessage,
    bool emitLoadingState = true,
  }) async {
    try {
      if (emitLoadingState) {
        setLoading();
      }
    } catch (e) {
      Exception(e.toString());
    }
  }
}
