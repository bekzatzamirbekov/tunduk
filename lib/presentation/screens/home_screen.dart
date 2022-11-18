import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Тестовое задание \nБекзата Замирбекова',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => {
                    provider.changeTitle('История полученных услуг'),
                    Navigator.pushNamed(context, '/third')},
                  child: const Text(
                    'История полученных услуг',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => {
                    provider.changeTitle('История обращений'),
                    Navigator.pushNamed(context, '/second')},
                  child: const Text(
                    'История обращений',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
