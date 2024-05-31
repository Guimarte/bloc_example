import 'package:bloc/bloc.dart';
import 'package:bloc_example/app/example_builder/bloc/example_builder_event.dart';
import 'package:bloc_example/app/example_builder/bloc/example_builder_state.dart';

class ExampleBuilderBloc
    extends Bloc<ExampleBuilderEvent, ExampleBuilderState> {
  ExampleBuilderBloc() : super(ExampleBuilderStateInitial()) {
    on<ChangeNameEvent>(_changeName);
  }
  String _name = "";
  String get name => _name;

  void _changeName(
      ChangeNameEvent event, Emitter<ExampleBuilderState> emitter) async {
    emitter(ExampleBuilderstateLoading());
    _name = event.name;

    await Future.delayed(Duration(seconds: 3));

    emitter(ExampleBuilderStateData(event.name));
  }
}
