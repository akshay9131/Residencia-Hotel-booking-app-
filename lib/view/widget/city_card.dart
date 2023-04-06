import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CityCard extends StatefulWidget {
  const CityCard({super.key});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  List images = [
    "ag.jpg",
    "bangl.jpg",
    "bpl.jpg",
    "del.jpg",
    "go.png",
    "indo.jpg",
    "jais.jpg",
    "lona.jpg",
    "mum.jpg",
    "pune.jpg",
    "sm.jpg",
    "ud.jpg",
    "visha.jpg"
  ];
  List name = [
    "Agra",
    "Bangalore",
    "Bhopal",
    "Delhi",
    "Goa",
    "Indore",
    "Jaisalmer",
    "Lonavala",
    "Mumbai",
    "Pune",
    "Sawai Madhopur",
    "Udaipur",
    "Vishakhapatnam"

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed("citylist", params: {"city": name[index]});
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 190, 189, 189),
                      offset: Offset.zero,
                      blurRadius: 8),
                ],
                image: DecorationImage(image: AssetImage("assets/images/${images[index]}"), fit: BoxFit.cover)
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 80),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: const Color.fromARGB(130, 0, 0, 0),
                  child: Text(
                    "${name[index]}", textAlign: TextAlign.center,style: const TextStyle(fontFamily: "Overpass", letterSpacing: 4,color: Colors.white,fontSize: 35, fontWeight: FontWeight.w900, shadows: [Shadow(offset: Offset(2, 2), color: Colors.grey, blurRadius: 2)]),
                  ),
                )
            
          ),
        );
      },
    );
  }
}
