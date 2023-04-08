import 'package:flutter/material.dart';
import 'package:travelapp/core/theme/theme.dart';
import 'package:travelapp/src/view/widget/city_card.dart';
import 'package:travelapp/core/theme/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Explore By Cities",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Padding(padding: EdgeInsets.all(10), child: CityCard()),
    );
  }
}
