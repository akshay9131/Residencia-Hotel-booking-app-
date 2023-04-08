import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/src/controller/dashboard_controller.dart';
import 'package:travelapp/core/theme/colors.dart';

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
            selectedItemColor: white,
            // backgroundColor: Colors.transparent,
            unselectedItemColor: textShadow,
            selectedLabelStyle: const TextStyle(
              color: white,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(color: textShadow, fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                backgroundColor: mainColor,
                  activeIcon: Icon(Icons.maps_home_work),
                  icon: Icon(Icons.maps_home_work_outlined),
                  label: "Home"),
              BottomNavigationBarItem(
                backgroundColor: mainColor,
                  activeIcon: Icon(Icons.search),
                  icon: Icon(Icons.search),
                  label: "Search"),
              BottomNavigationBarItem(
                backgroundColor: mainColor,
                  activeIcon: Icon(Icons.dashboard),
                  icon: Icon(Icons.dashboard_outlined),
                  label: "Category"),
              BottomNavigationBarItem(
                backgroundColor: mainColor,
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
