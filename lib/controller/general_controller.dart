import 'package:get/get.dart';

class GeneralController extends GetxController {
  static GeneralController get to => Get.find(); // add this

  RxBool isScheduleList = true.obs;
  RxInt currentPageNavigation = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
