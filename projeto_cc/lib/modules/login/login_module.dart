// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_cc/application/modules/module.dart';
import 'package:projeto_cc/modules/login/login_binding.dart';
import 'package:projeto_cc/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindings(),
    )
  ];
}
