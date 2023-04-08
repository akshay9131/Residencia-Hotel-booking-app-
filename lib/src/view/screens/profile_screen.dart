import 'package:flutter/material.dart';
import 'package:travelapp/core/theme/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge
        ),
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage("assets/images/logo1.png"),
            height: 120,
          ),
          const Divider(
            height: 2,
            color: mainColor,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded,
                color: mainColor),
            title: Text(
              "Account",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.local_offer, color: mainColor),
            title: Text(
              "Offers",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.wallet_sharp, color: mainColor),
            title: Text(
              "Wallet",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard_rounded,
                color: mainColor),
            title: Text(
              "Coupons",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_added_rounded,
                color: mainColor),
            title: Text(
              "Your Bookings",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.settings, color: mainColor),
            title: Text(
              "Setting",
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
        ],
      ),
    );
  }
}
