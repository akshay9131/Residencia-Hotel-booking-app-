import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/hotel_controller.dart';
import 'package:travelapp/view/widget/tab_view.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "Bhopal",
    ),
    Tab(
      text: "Indore",
    ),
    Tab(
      text: "Mumbai",
    ),
    Tab(
      text: "Bangalore",
    ),
    Tab(
      text: "Delhi",
    ),
    Tab(
      text: "Udaipur",
    ),
  ];

  final controller = Get.put(HotelController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    async();
    _tabController = TabController(length: myTabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            controller.getCityHotel("Bhopal");
            break;
          case 1:
            controller.getCityHotel("Indore");
            break;
          case 2:
            controller.getCityHotel("Mumbai");
            break;
          case 3:
            controller.getCityHotel("Bangalore");
            break;
          case 4:
            controller.getCityHotel("Delhi");
            break;
          case 5:
            controller.getCityHotel("Udaipur");
            break;
          default:
        }
      }
    });
  }

  Future<void> async() async {
    await controller.getCityHotel("Bhopal");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
        height: 400,
        child: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  bottom: ButtonsTabBar(
                      backgroundColor: const Color.fromARGB(255, 6, 42, 44),
                      unselectedBackgroundColor: Colors.grey[300],
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      controller: _tabController,
                      tabs: myTabs),
                ),
              ),
              body: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    TabViewWidget(),
                  ])),
        ));
  }
}
