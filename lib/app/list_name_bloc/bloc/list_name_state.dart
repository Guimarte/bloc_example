abstract class ListNameState {}

class ListNameInitialState extends ListNameState {}

class ListNameCompleteState extends ListNameState {
  List<String> names = [];
  ListNameCompleteState({required this.names});
}

class ListNameLoadingState extends ListNameState {}
