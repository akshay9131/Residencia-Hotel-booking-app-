import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/controller/hotel_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.put(HotelController());
  final SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 42, 44),
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Overpass",
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.SearchController,
                onChanged: (Value) => controller.searchHotel(),
                decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 6, 42, 44),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 6, 42, 44))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 6, 42, 44)))),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.SearchResults.isEmpty || controller.SearchController.text.trim().isEmpty
                    ? const Center(
                        child: Text("No data"),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.SearchResults.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => context.pushNamed("detail",
                                      params: {
                                        "id": controller.SearchResults[index].id
                                            .toString()
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
                                            color: Color.fromARGB(
                                                255, 190, 189, 189),
                                            offset: Offset.zero,
                                            blurRadius: 8)
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 190, 189, 189),
                                                    offset: Offset.zero,
                                                    blurRadius: 8)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${controller.SearchResults[index].images}"),
                                                  fit: BoxFit.cover)),
                                          margin: const EdgeInsets.all(8),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(9),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.SearchResults[index].name}",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 6, 42, 44)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${controller.SearchResults[index].city}",
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
                                                    "Rating : ${controller.SearchResults[index].rating}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  RatingBar.builder(
                                                      itemSize: 13,
                                                      initialRating: double
                                                          .parse(controller
                                                              .SearchResults[
                                                                  index]
                                                              .rating
                                                              .toString()),
                                                      minRating: 1,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 2),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber[600],
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
                                                "Price : ${controller.SearchResults[index].price}.00/-",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
