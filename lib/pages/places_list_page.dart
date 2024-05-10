import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../great_places.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({
    super.key,
  });

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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text('Nenhum local cadastrado!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemCount == 0
                    ? ch ?? const Text('Nenhum local cadastrado!')
                    : ListView.separated(
                        itemCount: greatPlaces.itemCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              backgroundImage: FileImage(
                                greatPlaces.itemByIndex(i).image,
                              ),
                            ),
                          ),
                          title: Text(
                            greatPlaces.items[i].title,
                          ),
                          subtitle: Text(
                            greatPlaces.items[i].location?.address ??
                                'Endereço desconhecido',
                          ),
                          onTap: () {},
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(),
                          );
                        },
                      ),
              ),
      ),
    );
  }
}
