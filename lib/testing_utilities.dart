import 'package:bloc_simple/simple_bloc.dart';
import 'package:bloc_simple/state_types.dart';
import 'package:bloc_test/bloc_test.dart';

void testSimpleBloc<Event, T>({
  required String description,
  required SimpleBloc<Event, T> Function() build,
  required Event event,
  required T expectedData,
  String? expectedMessage,
  List<SimpleState<T>> Function()? expect,
}) {
  blocTest<SimpleBloc<Event, T>, SimpleState<T>>(
    description,
    build: build,
    act: (bloc) => bloc.add(event),
    expect: expect ??
        () => [SimpleState<T>.loading(), SimpleState<T>.success(expectedData)],
  );
}
