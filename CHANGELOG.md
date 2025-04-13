# Changelog

All notable changes to this project will be documented in this file.

## [1.0.3] - 2025-04-10  
### Added
- `example/` directory with a working usage sample (`example/main.dart`)
- Widget test setup using `flutter_test` for counter UI
- `README.md` enhanced with detailed usage examples and API documentation
- `README.md` badges for version and license

### Fixed
- Bug in decrement button not triggering due to missing function call
- Typo in repository mixin exception message
- Improved layout structure of floating action buttons
- Updated internal state checks in `SimpleState` to support better error rendering

---

## [1.0.2] - 2025-04-10  
### Added
- `SimpleState<T>`: Unified state representation with `.initial()`, `.loading()`, `.success()`, and `.error()`.
- `SimpleCubit<T>`: Lightweight Cubit abstraction with helper methods.
- `SimpleBloc<Event, T>`: Simplified Bloc with built-in loading, success, and error handling via `executeAsync`.
- Repository pattern support:
  - `RepositoryConnector<T, R>` mixin
  - `RepositoryCubit<T, R>` abstract class
  - `RepositoryBloc<T, R>` abstract class
- Testing utility: `testSimpleBloc` to simplify Bloc test setup.
- Example usage for working with remote data using `SimpleBloc` and JSONPlaceholder.
- Basic usage guide and setup in README.

### Fixed
- Null safety improvements.
- Improved exception handling in `SimpleBloc`.

---

## [1.0.1] - 2025-04-08  
### Changed
- Minor documentation updates.
- File structure cleanup.
- Internal refactor for `SimpleBloc` base class.

---

## [1.0.0] - 2025-04-07  
### Initial Release
- State classes (`SimpleState`)
- Base classes (`SimpleCubit`, `SimpleBloc`)
- Project scaffold and structure.
