import 'package:flutter_admin/constants/enum.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  MenuDisplayType? menuDisplayType = MenuDisplayType.side;
  String fontFamily = 'Roboto';


  updateMenuDisplayType(v) {
    menuDisplayType = v;
    update();
  }

}
