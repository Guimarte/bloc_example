import 'package:bloc/bloc.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_event.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_state.dart';

class ListNameBloc extends Bloc<ListNameEvent, ListNameState> {
  ListNameBloc() : super(ListNameInitialState()) {
    on<FindAllNames>(_listName);
    on<AddNameEvent>(_addName);
    on<RemoveNameEvent>(_removeName);
  }

  List<String> names = ["Guilherme", "Érika", "Júlia"];
  List<String> get _names => names;

  Future<void> _listName(
      FindAllNames event, Emitter<ListNameState> emitter) async {
    emitter(ListNameLoadingState());
    await Future.delayed(Duration(seconds: 4));
    emitter(ListNameCompleteState(names: _names));
  }

  Future<void> _addName(
      AddNameEvent event, Emitter<ListNameState> emitter) async {
    List<String> newNames = [..._names];

    newNames.add(event.name);
    emitter(ListNameLoadingState());
    await Future.delayed(Duration(seconds: 4));
    emitter(ListNameCompleteState(names: newNames));
  }

  Future<void> _removeName(
      RemoveNameEvent event, Emitter<ListNameState> emitter) async {
    final newNames = [..._names];
    for (var element in newNames) {
      print(element);
    }
    emitter(ListNameLoadingState());
    newNames.removeAt(event.index);
    await Future.delayed(Duration(seconds: 4));
    emitter(ListNameCompleteState(names: newNames));
  }
}
