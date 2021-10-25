import 'package:projeto_cc/modules/login/login_control.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControler(loginService: Get.find()));
  }
}
