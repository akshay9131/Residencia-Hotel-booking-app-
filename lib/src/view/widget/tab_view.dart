import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/core/theme/colors.dart';

class TabViewWidget extends StatefulWidget {
  const TabViewWidget({super.key});

  @override
  State<TabViewWidget> createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget> {
  final controller = Get.put(HotelController());


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.CityHotelData.isEmpty && controller.isLoading.value ? 
      LoadingAnimationWidget.hexagonDots(color: mainColor, size: 20) 
      : Container(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.CityHotelData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: GestureDetector(
                  onTap: () => context.pushNamed("detail", params: {
                    "id": controller.CityHotelData[index].id.toString()
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10),
                    height: 310,
                    width: 280,
                    decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                              color: shadow,
                              offset: Offset.zero,
                              blurRadius: 8)
                        ],
                        borderRadius: BorderRadius.circular(6),
                        color: white),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                const BoxShadow(
                                    color: shadow,
                                    offset: Offset.zero,
                                    blurRadius: 8)
                              ],
                              image: DecorationImage(
                                  image:NetworkImage(
                                      "${controller.CityHotelData[index].images}"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.CityHotelData[index].name}",
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.CityHotelData[index].city!,
                               style: Theme.of(context).textTheme.titleSmall
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Rating : ${controller.CityHotelData[index].rating}",
                                    style: Theme.of(context).textTheme.displayLarge
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                      itemSize: 13,
                                      initialRating: double.parse(controller
                                          .CityHotelData[index].rating
                                          .toString()),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: rating,
                                          ),
                                      onRatingUpdate: (rating) {
                                        // ignore: avoid_print
                                        print(rating);
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
