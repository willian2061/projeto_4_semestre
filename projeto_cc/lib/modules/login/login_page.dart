// ignore_for_file: prefer_const_constructors

import 'package:projeto_cc/modules/login/login_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginControler> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              children: [
                Image.asset('assets/images/logoOTC.png'),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: Get.width * .7,
                  height: 50,
                  child: SignInButton(
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () => controller.login(),
                    text: 'Entrar Com Google',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: Get.width * .7,
                    height: 50,
                    child: SignInButton(
                      Buttons.Email,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () => controller.login(),
                      text: 'Entrar Com email',
                    ),
                  ),
                )
                // Obx(() {
                //   return Text(
                //     controller.nome.value,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   );
                // })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
