import 'package:get/get.dart';

class BottomController extends GetxController {
  var userNavigationBarIndexValue = 0;

  void navBarChange(int index) {
    userNavigationBarIndexValue = index;
    update();
  }
}
