import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/hotel_controller.dart';
import 'package:travelapp/view/widget/popular_card_widget.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  final controller = Get.put(HotelController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Hotels",
            style: TextStyle(
                color: Color.fromARGB(255, 6, 42, 44),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Overpass"
                )),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
            child: Column(
          children: const [
            PopularCard(),
          ],
        ))
      ],
    );
  }
}
