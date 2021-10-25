import 'package:get/get.dart';
import 'package:projeto_cc/modules/splash/splash_controler.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashControler());
  }
}
