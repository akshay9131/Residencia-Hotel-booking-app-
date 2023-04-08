import 'package:flutter/material.dart';
import 'package:travelapp/core/theme/theme.dart';
import 'package:travelapp/service/router/route.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          routerConfig: router.goRouter(),
        );
      },
    );
  }
}
