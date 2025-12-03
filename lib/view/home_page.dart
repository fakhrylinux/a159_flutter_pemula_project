import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      // TODO 1: change the widget below and add a Google office list
      body: const Center(child: Text('This is a text.')),
    );
  }

  void navigateToDetailPage(){
    // TODO 3: edit this function to navigate to DetailPage
  }
}
