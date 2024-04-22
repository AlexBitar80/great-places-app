import 'package:flutter/material.dart';
import 'great_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        AppRoutes.place_form: (ctx) => const PlaceFormPage(),
      },
    );
  }
}
