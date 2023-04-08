import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> position = 0.obs;

  void setPosition(int value) {
    position = value.obs;
  }
}
