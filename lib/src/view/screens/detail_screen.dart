import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/core/theme/colors.dart';


// ignore: must_be_immutable
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
                color: mainColor, size: 50),
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
                color: white,
              )),
          backgroundColor: mainColor,
          pinned: true,
          expandedHeight: 600,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "${controller.SingleHotelData[0].name}",
              textAlign: TextAlign.start,
              style:Theme.of(context).textTheme.titleLarge
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
                          style: Theme.of(context).textTheme.displayLarge
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
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: rating,
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
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "OVERVIEW",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${controller.SingleHotelData[0].about}",
                    style: Theme.of(context).textTheme.titleSmall
                  ),
                ),
                const SizedBox(height: 15),
                 Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Address",
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${controller.SingleHotelData[0].location}",
                    style: Theme.of(context).textTheme.titleSmall
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color.fromARGB(255, 6, 42, 44),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        "Book Now",
                        style:Theme.of(context).textTheme.titleLarge
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
