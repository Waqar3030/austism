import 'package:get/get.dart';

class BottomController extends GetxController {
  // The initial index of the bottom navigation bar
  var userNavigationBarIndexValue = 0;

  // Method to change the index when an item is tapped
  void navBarChange(int index) {
    userNavigationBarIndexValue = index;
    update();
  }
}
