import 'package:equatable/equatable.dart';

class SimpleState<T> extends Equatable {
  final bool isInitial;
  final bool isLoading;
  final T? data;
  final String? errorMessage;

  const SimpleState({
    this.isInitial = false,
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  //factory constructor for initial state
  factory SimpleState.initial() => SimpleState<T>(isInitial: true);

  //factory constructor for loading state
  factory SimpleState.loading() => SimpleState<T>(isLoading: true);

  //factory constructor for success state
  factory SimpleState.success(T data) => SimpleState<T>(data: data);

  //factory constructor for the error state
  factory SimpleState.error(String errorMessage) =>
      SimpleState<T>(errorMessage: errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [isInitial, isLoading, data, errorMessage];
}
