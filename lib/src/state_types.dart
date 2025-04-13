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
  factory SimpleState.initial() => SimpleState<T>(isLoading: true);

  //factory constructor for loading state
  factory SimpleState.loading() => SimpleState<T>(isLoading: true);

  //factory constructor for success state
  factory SimpleState.success(T data, {String? errorMessage}) =>
      SimpleState<T>(data: data, errorMessage: errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
