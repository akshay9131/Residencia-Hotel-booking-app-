import 'package:flutter/material.dart';
import 'package:travelapp/view/widget/router/route.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routerConfig: router.goRouter(),
    );
  }
}
