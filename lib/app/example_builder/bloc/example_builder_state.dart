import 'package:bloc/bloc.dart';

abstract class ExampleBuilderState {
  ExampleBuilderState();
}

class ExampleBuilderStateInitial extends ExampleBuilderState {
  ExampleBuilderStateInitial() : super();
}

class ExampleBuilderStateData extends ExampleBuilderState {
  final String name;
  ExampleBuilderStateData(this.name) : super();
}

class ExampleBuilderstateLoading extends ExampleBuilderState {
  ExampleBuilderstateLoading() : super();
}
