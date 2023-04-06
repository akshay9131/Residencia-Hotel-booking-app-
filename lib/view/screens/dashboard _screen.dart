import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/hotel_controller.dart';
import 'package:travelapp/view/widget/bottom_navigation_widget.dart';

class DashboardScreen extends StatefulWidget {
  Widget child;
  DashboardScreen({required this.child, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = Get.put(HotelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: BottomNavWidget(),
      ),
    );
  }
}
