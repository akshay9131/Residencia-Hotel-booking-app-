import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelapp/controller/hotel_controller.dart';

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
                  color: const Color.fromARGB(255, 6, 42, 44), size: 90),
            )
    ) :
    
     Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 6, 42, 44),
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                )),
            title: Text(
              widget.city,
              style: const TextStyle(fontFamily: "Overpass",color: Colors.white),
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
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 190, 189, 189),
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
                                          color: Color.fromARGB(
                                              255, 190, 189, 189),
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
                                      style: const TextStyle(
                                        fontFamily: "Overpass",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 6, 42, 44)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${controller.CityHotelData[index].city}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Rating : ${controller.CityHotelData[index].rating}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
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
                                            itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber[600],
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            }),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Price : ${controller.CityHotelData[index].price}.00/-",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
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
