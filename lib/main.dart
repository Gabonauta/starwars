import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/Providers/people_provider.dart';

import 'Presentation/Screens/screens.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PeopleProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Material App',
      home: const InitialScreen(),
    );
  }
}
