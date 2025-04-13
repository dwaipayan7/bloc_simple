BlocSimple


A simplified approach to using the BLoC pattern in Flutter. Reduce boilerplate, improve readability, and streamline state management with powerful utilities.

✨ Features
🔄 Simplified State Management
Pre-defined SimpleState<T> with built-in loading, error, and success handling.

📉 Minimal Boilerplate
Just extend SimpleCubit or SimpleBloc, no extra setup required.

🔌 Repository Integration
Easily connect BLoCs and Cubits to external data sources with RepositoryConnector.

⚡ Async Execution
Automatically handle async loading, success, and error states using executeAsync.

🧪 Testing Support
Built-in testing utilities for unit and widget tests.

🚀 Installation
Add this to your pubspec.yaml:

yaml
Copy
Edit
dependencies:
  bloc_simple: ^1.0.2
📦 Usage
🧮 Counter Cubit Example
dart
Copy
Edit
class CounterCubit extends SimpleCubit<int> {
  CounterCubit() {
    setSuccess(0); // initial value
  }

  void increment() => setSuccess((state.data ?? 0) + 1);
  void decrement() => setSuccess((state.data ?? 0) - 1);
}
🖼️ In UI
dart
Copy
Edit
BlocBuilder<CounterCubit, SimpleState<int>>(
  builder: (context, state) {
    if (state.isLoading) return CircularProgressIndicator();
    if (state.isError) return Text('Error: ${state.message}');
    return Text('Count: ${state.data ?? 0}');
  },
);
🌐 API Example with Repository
dart
Copy
Edit
class UserRepository {
  Future<List<User>> getUsers() async {
    return await fetchUsersFromAPI();
  }
}
dart
Copy
Edit
class UserCubit extends RepositoryCubit<List<User>, UserRepository> {
  UserCubit(UserRepository repo) : super(repo);

  Future<void> loadUsers() async {
    await executeAsync(() => getRepository().getUsers());
  }
}
dart
Copy
Edit
BlocBuilder<UserCubit, SimpleState<List<User>>>(
  builder: (context, state) {
    if (state.isInitial) return Text("Tap to load users");
    if (state.isLoading) return CircularProgressIndicator();
    if (state.isError) return Text("Error: ${state.message}");
    return ListView.builder(
      itemCount: state.data!.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(state.data![index].name),
      ),
    );
  },
);
⚙️ SimpleBloc with Events
dart
Copy
Edit
abstract class CounterEvent {}
class CounterIncremented extends CounterEvent {}
class CounterDecremented extends CounterEvent {}
dart
Copy
Edit
class CounterBloc extends SimpleBloc<CounterEvent, int> {
  CounterBloc() {
    setSuccess(0); // Initial state
  }

  @override
  void registerEventHandlers() {
    on<CounterIncremented>((event, emit) =>
        emit(SimpleState.success((state.data ?? 0) + 1)));
    on<CounterDecremented>((event, emit) =>
        emit(SimpleState.success((state.data ?? 0) - 1)));
  }
}
📊 State Types
SimpleState<T> provides:

SimpleState.initial() – Initial idle state

SimpleState.loading() – While loading

SimpleState.success(data) – On success

SimpleState.error(message) – On error

🧪 Testing Utilities
Easily test your SimpleCubit or SimpleBloc with:

dart
Copy
Edit
testSimpleCubit<int>(
  description: 'emits [loading, success] on increment',
  build: () => CounterCubit(),
  act: (cubit) => cubit.increment(),
  expectedData: 1,
);
📁 Example App
Explore the example directory for a working sample.

📜 License
MIT © Dwaipayan Biswas

Built with ❤️ by [Dwaipayan Biswas](https://github.com/dwaipayan7)