import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/core/theme/colors.dart';
import 'package:travelapp/src/view/widget/popular_card_widget.dart';

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
         Text("Hotels",
            style: Theme.of(context).textTheme.displayMedium),
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
