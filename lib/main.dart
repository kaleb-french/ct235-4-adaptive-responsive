import 'package:flutter/material.dart';
import 'classes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 6',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
            ),
        ),
        colorScheme: .fromSeed(seedColor: Colors.blue, brightness: Brightness.light),
      ),
      home: MyHomePage(title: 'Travel Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
    MyHomePage({super.key, required this.title});

  Destination dest = Destination(name: "Fiji", icon: Icons.flight);
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center( child: Text(dest.name,
        style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      );
  }
}
