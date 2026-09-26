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

    final List<Destination> destinations = [
      Destination(name: "Home", icon: Icons.home),
      Destination(name: "Explore", icon: Icons.explore),
      Destination(name: "Bookings", icon: Icons.book),
      Destination(name: "Profile", icon: Icons.person),
    ];
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < 600) {
      return MobileLayout(destinations: destinations);
    } else {
      return DesktopLayout(destinations: destinations);
    }
  }
}
class MobileLayout extends StatelessWidget {
  final List<Destination> destinations;

  const MobileLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DealDashboard(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: destinations.map((destination) {
            return Expanded(
              child: ListTile(
                leading: Icon(destination.icon),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class DesktopLayout extends StatelessWidget {
  final List<Destination> destinations;

  const DesktopLayout({
    super.key,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: destinations.map((destination) {
                return ListTile(
                  leading: Icon(destination.icon),
                  title: Text(destination.name),
                );
              }).toList(),
            ),
          ),
        Expanded(
        child: DealDashboard(),
        )
        ],
      ),
    );
  }
}
class DealDashboard extends StatelessWidget{
  DealDashboard({super.key});

  final List<TravelDeal> deals = [
    TravelDeal(
      title: "Paris Getaway",
      price: 1299.99,
      description: "A seven-day trip to Paris.",
      isPremium: true,
    ),
    TravelDeal(
      title: "Beach Vacation",
      price: 899.99,
      description: "Relax on a tropical beach.",
      isPremium: false,
    ),
    TravelDeal(
      title: "Mountain Adventure",
      price: 749.99,
      description: "Explore beautiful mountain scenery.",
      isPremium: false,
    ),
    TravelDeal(
      title: "Tokyo Experience",
      price: 1599.99,
      description: "Experience Tokyo and Japanese culture.",
      isPremium: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return GridView.count(
              crossAxisCount: 2,
              children: deals.map((deal) {
                return DealCard(deal: deal);
              }).toList(),
            );
          } else {
            return ListView(
              children: deals.map((deal) {
                return DealCard(deal: deal);
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
class DealCard extends StatelessWidget {
  final TravelDeal deal;

  const DealCard({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(deal.title,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            Text("\$${deal.price.toStringAsFixed(2)}",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ],
        ),
      ),
    );
    if (deal.isPremium) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.light,
          ),
        ),
        child: card,
      );
    }
    return card;
  }
}