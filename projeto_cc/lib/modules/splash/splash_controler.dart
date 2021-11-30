import 'package:get/get.dart';

class SplashControler extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offAllNamed('/login');
  } //função jogado no application binding
}
