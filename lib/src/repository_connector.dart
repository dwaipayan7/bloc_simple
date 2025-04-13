import 'package:bloc_simple/src/simple_cubit.dart';
import 'package:bloc_simple/src/simple_bloc.dart';

/// Mixin to connect a Cubit or Bloc to a repository
mixin RepositoryConnector<T, R> {
  late final R _repository;

  /// Initialize the repository
  void initRepository(R repository) {
    _repository = repository;
  }

  /// Get the repository or throw if not initialized
  R getRepository() {
    try {
      return _repository;
    } catch (_) {
      throw Exception("Repository not initialized. Call initRepository first.");
    }
  }
}

/// Abstract base class that implements the mixin for Cubits
abstract class RepositoryCubit<T, R> extends SimpleCubit<T>
    with RepositoryConnector<T, R> {
  RepositoryCubit(R repository) {
    initRepository(repository);
  }
}

/// Abstract base class that implements the mixin for Blocs
abstract class RepositoryBloc<Event, T, R> extends SimpleBloc<Event, T>
    with RepositoryConnector<T, R> {
  RepositoryBloc(R repository) {
    initRepository(repository);
  }
}
