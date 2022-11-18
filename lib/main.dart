import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunduk/presentation/screens/history_treatment/history_treatment.dart';
import 'package:tunduk/provider/main_provider/provider.dart';
import 'package:tunduk/provider/show_modal_provider/provider.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/history_services/history_services.dart';
import 'provider/time_date/time_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomList>(
        create: (BuildContext context) => BottomList()),
        ChangeNotifierProvider<TimeDateProvider>(
        create: (BuildContext context) => TimeDateProvider()),
        ChangeNotifierProvider<MainProvider>(
        create: (BuildContext context) => MainProvider())
    ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => const HomeScreen(title: 'Tunduk'),
            '/second': (context) => const SecondScreen(),
            '/third': (context) => const ThirdScreen()
          },
        ),
    );
  }
}
