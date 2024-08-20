import 'package:get/get_state_manager/get_state_manager.dart';

class BottomController extends GetxController {
  var navigationBarIndexValue = 0;

  int get userNavigationBarIndexValue =>
      navigationBarIndexValue; // Return the actual value

  void navBarChange(int value) {
    navigationBarIndexValue = value;
    update();
  }
}
