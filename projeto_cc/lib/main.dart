import 'package:projeto_cc/services/auth_check.dart';
import 'package:projeto_cc/services/auth_service.dart';
import 'package:projeto_cc/application/bindings/application_bindings.dart';
import 'package:projeto_cc/modules/cadastro/cad_module.dart';
import 'package:projeto_cc/modules/cadastro/cad_page.dart';
import 'package:projeto_cc/modules/home/home_module.dart';
import 'package:projeto_cc/modules/login/login_module.dart';
import 'package:projeto_cc/modules/login/login_page.dart';
import 'package:projeto_cc/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projeto_cc/provider/users.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //RemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Users(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => AuthService(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          // initialBinding: ApplicationBindings(),
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          getPages: [
            ...SplashModule().routers,
            ...LoginModule().routers,
            ...HomeModule().routers,
            ...CadModule().routers,
          ],
          home: AuthCheck(),
        ));
  }
}
