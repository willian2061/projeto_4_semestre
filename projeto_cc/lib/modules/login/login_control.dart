// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:projeto_cc/application/ui/loader/loader_mixin.dart';
import 'package:projeto_cc/application/ui/messages/messages_mixin.dart';
import 'package:projeto_cc/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginControler extends GetxController with LoaderMixin, MessagesMixin {
  //RxString nome = RxString('willian yu chen');
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginControler({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    //nome.value = 'nao sei';
    try {
      loading(true);
      await _loginService.login();
      //await 2.seconds.delay();
      // await Future.delayed(Duration(seconds: 2));
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login realizado com sucesso'));
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
          MessageModel.error(title: 'Login error', message: 'Erro no login'));
    }
  }
}
