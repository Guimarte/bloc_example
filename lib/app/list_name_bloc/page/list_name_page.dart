import 'package:bloc_example/app/list_name_bloc/bloc/list_name_bloc.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_event.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListNamePage extends StatelessWidget {
  const ListNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Name Bloc'),
        ),
        body: BlocBuilder<ListNameBloc, ListNameState>(
          builder: (context, state) {
            if (state is ListNameLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ListNameCompleteState) {
              return Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.names.length,
                      itemBuilder: (context, index) {
                        final name = state.names[index];
                        return ListTile(
                          onTap: () {
                            context
                                .read<ListNameBloc>()
                                .add(RemoveNameEvent(index: index));
                          },
                          title: Text(name),
                        );
                      }),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<ListNameBloc>()
                            .add(AddNameEvent(name: "Marcio"));
                      },
                      child: Text("Adicionar Nome"))
                ],
              );
            }
            return SizedBox.shrink();
          },
        ));
  }
}
