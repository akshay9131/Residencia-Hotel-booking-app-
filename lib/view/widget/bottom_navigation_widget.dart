import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/controller/dashboard_controller.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: controller.position.value,
        onTap: (value) => tap(value),
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 6, 42, 44),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 6, 42, 44),
              activeIcon: Icon(Icons.maps_home_work),
              icon: Icon(Icons.maps_home_work_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.search),
              icon: Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.dashboard),
              icon: Icon(Icons.dashboard_outlined),
              label: "Category"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_2_outlined),
              label: "Profile"),
        ]);
  }

  void tap(int index) {
    controller.setPosition(index);

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/category');
        break;
      case 3:
        context.go('/profile');
        break;
      default:
    }
  }
}
