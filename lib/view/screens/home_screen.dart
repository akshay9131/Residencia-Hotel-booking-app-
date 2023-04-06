import 'package:flutter/material.dart';
import 'package:travelapp/controller/hotel_controller.dart';
import 'package:travelapp/view/widget/popular.dart';
import 'package:travelapp/view/widget/tab.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HotelController());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    async();
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent 
         ) {
        if (controller.hasMoreData.value) {
          controller.Page.value = controller.Page.value + 1;
          await controller.controlAllHotels();
          controller.hasMoreData.value =
              controller.AllHotelsData.value.length ==
                      controller.maxLengthOfData.value
                  ? false
                  : true;
        }
      }
    });
  }

  Future<void> async() async {
    await controller.setTotalLength();
    await controller.controlAllHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.AllHotelsData.isEmpty) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading:
                  const Image(image: AssetImage("assets/images/logo1.png")),
              title: Column(
                children: const [
                  Text(
                    "Residencia",
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 42, 44),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Choose your comfort",
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 42, 44),
                        fontWeight: FontWeight.bold,
                        fontSize: 9),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notification_important),
                  color: const Color.fromARGB(255, 6, 42, 44),
                  iconSize: 22,
                )
              ],
            ),
            body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: const Color.fromARGB(255, 6, 42, 44), size: 50),
            ));
      }
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const Image(image: AssetImage("assets/images/logo1.png")),
            title: Column(
              children: const [
                Text(
                  "Residencia",
                  style: TextStyle(
                      color: Color.fromARGB(255, 6, 42, 44),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Choose your comfort",
                  style: TextStyle(
                      color: Color.fromARGB(255, 6, 42, 44),
                      fontWeight: FontWeight.bold,
                      fontSize: 9),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important),
                color: const Color.fromARGB(255, 6, 42, 44),
                iconSize: 22,
              )
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Best For You",
                    style: TextStyle(
                      fontFamily: 'Overpass',
                        color: Color.fromARGB(255, 6, 42, 44),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  PopularWidget()
                ],
              ),
            ),
          ));
    });
  }
}
