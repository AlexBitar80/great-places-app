import 'package:flutter/material.dart';

import '../great_places.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.place_form);
            },
          ),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
