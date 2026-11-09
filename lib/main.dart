import 'detail_screen.dart';
import 'menu_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PizzaApp());

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store',
      initialRoute: 'menu',
      routes: {
        'menu': (context) => const MenuScreen(),
        'vegetable': (context) => const DetailScreen(
          name: 'Vegetable Pizza',
          image: 'assets/images/vegetable.jpeg',
          description: 'Fresh vegetables on a crisp, golden crust.',
        ),
       'cheese': (context) => const DetailScreen(
          name: 'Cheese Pizza',
          image: 'assets/images/cheese.jpeg',
          description: 'Classic pizza with melted mozzarella cheese.',
         ),
      'fries': (context) => const DetailScreen(
          name: 'Box of Fries',
          image: 'assets/images/fries.jpeg',
          description: 'Hot, crispy fries with a pinch of salt.',
        ),
      },
    );
  }
}