import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  Widget _menuCard(BuildContext context, String title, String route) {
    return Card(
      color: Colors.orange,
      child: ListTile(
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Store Menu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuCard(context, 'Vegetable Pizza', 'vegetable'),
          _menuCard(context, 'Cheese Pizza', 'cheese'),
          _menuCard(context, 'Box of Fries', 'fries'),
        ],
      ),
    );
  }
}