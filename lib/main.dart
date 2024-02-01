import 'package:flutter/material.dart';
import 'package:news_app/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // api key...
    //cc186411735643798befec48f3282536
    // every thing is
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=cc186411735643798befec48f3282536
    // top head lines
    //https://newsapi.org/v2/top-headlines?country=us&apiKey=cc186411735643798befec48f3282536
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
