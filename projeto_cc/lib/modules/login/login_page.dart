// ignore_for_file: prefer_const_constructors

import 'package:projeto_cc/modules/cadastro/cad_page.dart';
import 'package:projeto_cc/modules/login/login_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginControler> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usuarioController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _show = false;

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
            color: Colors.black54,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Image.asset('assets/images/logoOTC.png'),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 120),
                            child: SizedBox(
                              width: Get.width * .8,
                              height: 65,
                              child: TextFormField(
                                controller: usuarioController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: "Usuário: ",
                                  labelStyle: TextStyle(
                                      color: Colors.black54,
                                      height: 0,
                                      fontSize: 15),
                                  floatingLabelStyle: TextStyle(
                                      color: Colors.black54,
                                      height: 4,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: Get.width * .8,
                              height: 65,

                              //color: Colors.white,

                              child: TextFormField(
                                controller: senhaController,
                                obscureText: _show,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: "Senha: ",
                                  labelStyle: TextStyle(
                                      color: Colors.black54,
                                      height: 0,
                                      fontSize: 15),
                                  floatingLabelStyle: TextStyle(
                                      color: Colors.black54,
                                      height: 4,
                                      fontSize: 15),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe sua senha';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 100, top: 10),
                          //   child: check(),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100, top: 1),
                            child: TextButton(
                              child: Text('ainda não tem conta?'),
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                                fixedSize: Size(Get.width * .5, 5),
                              ),
                              onPressed: () {
                                navigator!.pushNamed('/cad');
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 200, top: 10),
                            child: ElevatedButton(
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                fixedSize: Size(Get.width * .3, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                if (usuarioController.text == "") {
                                  Get.snackbar('erro', 'preencha os campos');
                                } else {
                                  Get.offAllNamed('/home');
                                }
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class check extends StatefulWidget {
//   const check({Key? key}) : super(key: key);

//   @override
//   _checkState createState() => _checkState();
// }

// class _checkState extends State<check> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       checkColor: Colors.white,
//       //fillColor:  MaterialStateProperty.resolveWith((states) => null),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }
