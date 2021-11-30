import 'package:projeto_cc/services/auth_service.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    // Get.lazyPut<LoginService>(
    //     () => LoginServiceImpl(loginRepository: Get.find()),
    //     fenix: true);
    // Get.put(AuthService()).init();
  }
}
//classes que ficarão ativos sempre