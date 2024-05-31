import 'package:bloc_example/app/example_builder/bloc/example_builder_bloc.dart';
import 'package:bloc_example/app/example_builder/bloc/example_builder_event.dart';
import 'package:bloc_example/app/example_builder/bloc/example_builder_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleBuilderPage extends StatelessWidget {
  ExampleBuilderPage({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Builder'),
      ),
      body: Column(
        children: [
          BlocBuilder<ExampleBuilderBloc, ExampleBuilderState>(
            builder: (context, state) {
              if (state.runtimeType == ExampleBuilderstateLoading) {
                return CircularProgressIndicator();
              }
              if (state.runtimeType == ExampleBuilderStateData) {
                return Text("Nome: ${(state as ExampleBuilderStateData).name}");
              } else {
                return Text("Nome: VAZIO");
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<ExampleBuilderBloc>()
                  .add(ChangeNameEvent(name: textEditingController.value.text));
            },
            child: const Text("Mudar Nome"),
          ),
          TextFormField(
            controller: textEditingController,
          )
        ],
      ),
    );
  }
}
