import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/core/theme/colors.dart';

// ignore: must_be_immutable
class CityList extends StatefulWidget {
  String city;
  CityList({super.key, required this.city});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  final controller = Get.put(HotelController());
  @override
  void initState() {
    super.initState();
    async();
  }

  Future<void> async() async {
    await controller.getCityHotel(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    controller.CityHotelData.isEmpty ? 
    Scaffold(
       body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: mainColor, size: 90),
            )
    ) :
    
     Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: white,
                )),
            title: Text(
              widget.city,
              style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.CityHotelData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.pushNamed("detail", params: {
                          "id": controller.CityHotelData[index].id.toString()
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: const [
                              BoxShadow(
                                  color: shadow,
                                  offset: Offset.zero,
                                  blurRadius: 8)
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: 100,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: shadow,
                                          offset: Offset.zero,
                                          blurRadius: 8)
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${controller.CityHotelData[index].images}"),
                                        fit: BoxFit.cover)),
                                margin: const EdgeInsets.all(8),
                              ),
                              Container(
                                margin: const EdgeInsets.all(9),
                                height: MediaQuery.of(context).size.height,
                                width: 200,
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
                                      "${controller.CityHotelData[index].city}",
                                      style: Theme.of(context).textTheme.titleSmall
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Rating : ${controller.CityHotelData[index].rating}",
                                          style: Theme.of(context).textTheme.displayLarge
                                        ),
                                        const SizedBox(width: 5),
                                        RatingBar.builder(
                                            itemSize: 13,
                                            initialRating: double.parse(
                                                controller
                                                    .CityHotelData[index].rating
                                                    .toString()),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 2),
                                            itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: rating,
                                                ),
                                            onRatingUpdate: (rating) {
                                              // ignore: avoid_print
                                              print(rating);
                                            }),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Price : ${controller.CityHotelData[index].price}.00/-",
                                      style: Theme.of(context).textTheme.titleMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
