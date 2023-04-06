import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelapp/controller/hotel_controller.dart';


class DetailScreen extends StatefulWidget {
  String? id;
  DetailScreen({super.key, this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = Get.put(HotelController());
  @override
  void initState() {
    async(widget.id);
    super.initState();
  }

  Future<void> async(id) async {
    await controller.getSingleHotel(id);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.SingleHotelData.isEmpty) {
        return Scaffold(
          body: Center(
            child: LoadingAnimationWidget.hexagonDots(
                color: Colors.black, size: 45),
          ),
        );
      }
      return Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          backgroundColor: const Color.fromARGB(255, 6, 42, 44),
          pinned: true,
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "${controller.SingleHotelData[0].name}",
              style: const TextStyle(fontFamily: "Overpass",color: Colors.white),
            ),
            background: Stack(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "${controller.SingleHotelData[0].images}"),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high)))
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Ratings ${controller.SingleHotelData[0].rating}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        RatingBar.builder(
                            itemSize: 14,
                            initialRating: double.parse(controller
                                .SingleHotelData[0].rating
                                .toString()),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber[600],
                                ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Price : ${controller.SingleHotelData[0].price}.00/-",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "OVERVIEW",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${controller.SingleHotelData[0].about}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Address",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${controller.SingleHotelData[0].location}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 6, 42, 44),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]));
    });
  }
}
