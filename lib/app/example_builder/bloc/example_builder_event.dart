import 'package:bloc/bloc.dart';

abstract class ExampleBuilderEvent {}

class ChangeNameEvent extends ExampleBuilderEvent {
  final String name;
  ChangeNameEvent({required this.name});
}

class ExampleBuilderLoadingEvent extends ExampleBuilderEvent {
  ExampleBuilderLoadingEvent();
}
