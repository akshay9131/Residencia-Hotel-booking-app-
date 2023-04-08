import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/src/view/widget/bottom_navigation_widget.dart';

// ignore: must_be_immutable
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
          bottomNavigationBar: const BottomNavWidget(),
              
        );
  }
}
