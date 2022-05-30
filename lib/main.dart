import 'package:flutter/material.dart';
import 'package:flutter_training_2/di/app_provider.dart';
import 'package:flutter_training_2/ui/movie_list/movie_list.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: appProviders,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training 2',
      theme: ThemeData(),
      home: const MovieList(),
    );
  }
}
