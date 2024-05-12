import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'great_places.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'environments.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
        ),
        home: const PlacesListPage(),
        routes: {
          AppRoutes.placeForm: (ctx) => const PlaceFormPage(),
          AppRoutes.placeDetail: (ctx) => const PlaceDetailPage(),
        },
      ),
    );
  }
}
