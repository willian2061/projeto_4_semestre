import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_cc/application/modules/module.dart';
import 'package:projeto_cc/modules/cadastro/cad_page.dart';

class CadModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/cad',
      page: () => CadPage(),
    )
  ];
}
