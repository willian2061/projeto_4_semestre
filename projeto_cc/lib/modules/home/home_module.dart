import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_cc/application/modules/module.dart';
import 'package:projeto_cc/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [GetPage(name: '/home', page: () => HomePage())];
}
