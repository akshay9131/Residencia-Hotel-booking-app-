import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/src/controller/hotel_controller.dart';
import 'package:travelapp/core/theme/colors.dart';
import 'package:travelapp/core/theme/theme.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({super.key});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  final controller = Get.put(HotelController());
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.AllHotelsData.length +
                  (controller.hasMoreData.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (controller.AllHotelsData.length == index) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GestureDetector(
                  onTap: () => context.pushNamed("detail", params: {
                    "id": controller.AllHotelsData[index].id.toString()
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
                                      "${controller.AllHotelsData[index].images}"),
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
                                "${controller.AllHotelsData[index].name}",
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${controller.AllHotelsData[index].city}",
                                style: AppTheme.lightTheme.textTheme.titleSmall
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Rating : ${controller.AllHotelsData[index].rating}",
                                    style: Theme.of(context).textTheme.displayLarge
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                      itemSize: 13,
                                      initialRating: double.parse(controller
                                          .AllHotelsData[index].rating
                                          .toString()),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
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
                                "Price : ${controller.AllHotelsData[index].price}.00/-",
                                style: Theme.of(context).textTheme.titleMedium
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
        ));
  }
}
