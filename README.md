text
# BlocSimple

[![Pub Version](https://img.shields.io/pub/v/bloc_simple.svg)](https://pub.dev/packages/bloc_simple)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simplified approach to using the BLoC pattern in Flutter, reducing boilerplate and providing utilities for common patterns.

## Features

- 🔄 **Simplified State Management**: Pre-defined state types with built-in loading/error handling
- 📝 **Reduced Boilerplate**: Write less code while maintaining the BLoC pattern benefits
- 🔌 **Repository Integration**: Easy connection between BLoCs/Cubits and data sources
- 🧪 **Testing Support**: Helper methods for quick and easy testing
- ⚡ **Async Operation Handling**: Automatic state transitions during async operations

## Installation

Add `bloc_simple` to your `pubspec.yaml`:

dependencies:
bloc_simple: ^0.1.0

text

## Usage

### Simple Counter Example

// 1. Create a Cubit
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

// 2. Use it in your UI
class CounterView extends StatelessWidget {
@override
Widget build(BuildContext context) {
return BlocBuilder<CounterCubit, SimpleState<int>>(
builder: (context, state) {
if (state.isLoading) {
return CircularProgressIndicator();
}

text
    if (state.isError) {
      return Text('Error: ${state.message}');
    }
    
    return Text(
      'Count: ${state.data ?? 0}',
      style: TextStyle(fontSize: 24),
    );
  },
);
}
}

text

### API Example with Repository

// 1. Define your repository
class UserRepository {
Future<List<User>> getUsers() async {
// Your API implementation
return yourApiCall();
}
}

// 2. Create a Cubit with repository integration
class UserCubit extends RepositoryCubit<List<User>, UserRepository> {
UserCubit(UserRepository repository) : super(repository);

Future<void> loadUsers() async {
// This automatically handles loading, success, and error states
await executeAsync(() => getRepository().getUsers());
}
}

// 3. Use in your UI with automatic state handling
class UserListView extends StatelessWidget {
@override
Widget build(BuildContext context) {
return BlocBuilder<UserCubit, SimpleState<List<User>>>(
builder: (context, state) {
if (state.isInitial) {
return Center(child: Text('Press button to load users'));
}

text
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    if (state.isError) {
      return Center(child: Text('Error: ${state.message}'));
    }
    
    final users = state.data!;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(users[index].name),
        subtitle: Text(users[index].email),
      ),
    );
  },
);
}
}

text

### Using SimpleBloc with Events

// 1. Define events
abstract class CounterEvent {}
class CounterIncremented extends CounterEvent {}
class CounterDecremented extends CounterEvent {}

// 2. Create a Bloc
class CounterBloc extends SimpleBloc<CounterEvent, int> {
CounterBloc() : super();

@override
void registerEventHandlers() {
on<CounterIncremented>(_onIncremented);
on<CounterDecremented>(_onDecremented);

text
// Initialize with 0
setSuccess(0);
}

void _onIncremented(CounterIncremented event, Emitter<SimpleState<int>> emit) {
final currentValue = state.data ?? 0;
emit(SimpleState.success(currentValue + 1));
}

void _onDecremented(CounterDecremented event, Emitter<SimpleState<int>> emit) {
final currentValue = state.data ?? 0;
emit(SimpleState.success(currentValue - 1));
}
}

text

## State Types

`SimpleState<T>` provides a standardized approach to handling common states:

- `SimpleState.initial()`: Initial state before any operations
- `SimpleState.loading()`: Loading state during operations
- `SimpleState.success(data)`: Success state with data
- `SimpleState.error(exception)`: Error state with exception details

## Additional Features

- **Automatic Error Handling**: The `executeAsync` method wraps operations in try-catch blocks
- **Message Support**: Add custom messages to success and error states
- **Repository Connector**: Mix-in for easy repository integration
- **Testing Utilities**: Helper methods for testing BLoCs and Cubits

## Example Project

Check out the [example](https://github.com/dwaipayan7/bloc_simple) directory for a complete sample application.

## License

MIT License - see the [LICENSE](LICENSE) file for details.

Built with ❤️ by [Dwaipayan Biswas](https://github.com/dwaipayan7)