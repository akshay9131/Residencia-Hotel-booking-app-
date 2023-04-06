import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 42, 44),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Overpass",
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: const [
          Image(
            image: AssetImage("assets/images/logo1.png"),
            height: 120,
          ),
          Divider(
            height: 2,
            color: Color.fromARGB(255, 6, 42, 44),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded,
                color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Account",
              style: TextStyle(
                  fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.local_offer, color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Offers",
              style: TextStyle(
                fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.wallet_sharp, color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Wallet",
              style: TextStyle(
                fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard_rounded,
                color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Coupons",
              style: TextStyle(
                fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added_rounded,
                color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Your Bookings",
              style: TextStyle(
                fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.settings, color: Color.fromARGB(255, 6, 42, 44)),
            title: Text(
              "Setting",
              style: TextStyle(
                fontFamily: "Overpass",
                  color: Color.fromARGB(255, 6, 42, 44),
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
