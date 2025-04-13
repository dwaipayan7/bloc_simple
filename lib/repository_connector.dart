import 'package:meta/meta.dart';
import 'package:bloc_simple/simple_bloc.dart';
import 'package:bloc_simple/simple_cubit.dart';

/// Mixin to connect a Cubit or Bloc to a repository
mixin RepositoryConnector<T, R> {
  late final R _repository;

  /// Initialize the repository
  @protected
  void initRepository(R repository) {
    _repository = repository;
  }

  /// Get the repository or throw if not initialized
  @protected
  R getRepository() {
    if (_repository == null) {
      throw StateError(
          "Repository not initialized. Call initRepository first.");
    }
    return _repository;
  }

  /// Checks if repository is initialized
  @protected
  bool get isRepositoryInitialized => _repository != null;
}

/// Abstract base class that implements the mixin for Cubits
abstract class RepositoryCubit<T, R> extends SimpleCubit<T>
    with RepositoryConnector<T, R> {
  /// Creates a new RepositoryCubit with the given repository
  RepositoryCubit(R repository) : super() {
    initRepository(repository);
  }
}

/// Abstract base class that implements the mixin for Blocs
abstract class RepositoryBloc<Event, T, R> extends SimpleBloc<Event, T>
    with RepositoryConnector<T, R> {
  /// Creates a new RepositoryBloc with the given repository
  RepositoryBloc(R repository) : super() {
    initRepository(repository);
  }
}
