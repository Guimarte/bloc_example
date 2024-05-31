import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Bloc'),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/example_builder");
                },
                child: const Text("Example Builder Bloc")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/list_name");
                },
                child: const Text("List Name")),
          ],
        ),
      ),
    );
  }
}
