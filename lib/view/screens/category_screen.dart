import 'package:flutter/material.dart';
import 'package:travelapp/view/widget/city_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 42, 44),
        centerTitle: true,
        title: const Text(
          "Explore By Cities",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Padding(padding: EdgeInsets.all(10), child: CityCard()),
    );
  }
}
