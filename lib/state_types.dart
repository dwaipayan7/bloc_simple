import 'package:equatable/equatable.dart';

class SimpleState<T> extends Equatable {
  final bool isInitial;
  final bool isLoading;
  final bool isError;
  final T? data;
  final String? errorMessage;

  const SimpleState({
    this.isInitial = false,
    this.isLoading = false,
    this.isError = false,
    this.data,
    this.errorMessage,
  });

  /// Factory constructor for initial state
  factory SimpleState.initial() => SimpleState<T>(isInitial: true);

  /// Factory constructor for loading state
  factory SimpleState.loading() => SimpleState<T>(isLoading: true);

  /// Factory constructor for success state
  factory SimpleState.success(T data) => SimpleState<T>(data: data);

  /// Factory constructor for error state
  factory SimpleState.error(String errorMessage) =>
      SimpleState<T>(isError: true, errorMessage: errorMessage);

  @override
  List<Object?> get props => [
    isInitial,
    isLoading,
    isError,
    data,
    errorMessage,
  ];
}
