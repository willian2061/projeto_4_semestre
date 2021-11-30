import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cc/models/user.dart';
import 'package:projeto_cc/provider/users.dart';
import 'package:provider/provider.dart';

class CadPage extends StatelessWidget {
  const CadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController nomeController = TextEditingController();
    // TextEditingController senhaController = TextEditingController();
    // TextEditingController senha2Controller = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final Map<String, String> _formData = {};

    // void _loadFormData(User user) {
    //   if (user != null) {
    //     _formData['id'] = user.id!;
    //     _formData['name'] = user.name!;
    //     _formData['email'] = user.email!;
    //     _formData['senha'] = user.senha!;
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro'),
        backgroundColor: Colors.orange[600],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: SizedBox(
                        width: Get.width * .8,
                        height: 65,
                        child: TextFormField(
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
                            labelText: "Email: ",
                            labelStyle: TextStyle(
                                color: Colors.black54, height: 0, fontSize: 15),
                            floatingLabelStyle: TextStyle(
                                color: Colors.black54, height: 4, fontSize: 15),
                          ),
                          onSaved: (value) => _formData['email'] = value!,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: Get.width * .8,
                        height: 65,
                        child: TextFormField(
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
                            labelText: "Nome: ",
                            labelStyle: TextStyle(
                                color: Colors.black54, height: 0, fontSize: 15),
                            floatingLabelStyle: TextStyle(
                                color: Colors.black54, height: 4, fontSize: 15),
                          ),
                          onSaved: (value) => _formData['name'] = value!,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: Get.width * .8,
                        height: 65,
                        child: TextFormField(
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
                                color: Colors.black54, height: 0, fontSize: 15),
                            floatingLabelStyle: TextStyle(
                                color: Colors.black54, height: 4, fontSize: 15),
                          ),
                          onSaved: (value) => _formData['senha'] = value!,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Sua senha deve conter caracteres';
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: Get.width * .8,
                        height: 65,
                        child: TextFormField(
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
                            labelText: "Confirmação Senha: ",
                            labelStyle: TextStyle(
                                color: Colors.black54, height: 0, fontSize: 15),
                            floatingLabelStyle: TextStyle(
                                color: Colors.black54, height: 4, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 55),
                      child: ElevatedButton(
                        child: Text('Cadastrar'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                          fixedSize: Size(Get.width * .7, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            _formKey.currentState!.save();
                            Provider.of<Users>(context, listen: false).put(
                              User(
                                id: _formData['id'],
                                name: _formData['name'],
                                email: _formData['email'],
                                senha: _formData['senha'],
                              ),
                            );
                            Navigator.of(context).pop();
                          } else {
                            Get.snackbar('erro', 'preencha os campos',
                                backgroundColor: Colors.red);
                            //Get.offAllNamed('/home');

                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black45,
    );
  }
}
