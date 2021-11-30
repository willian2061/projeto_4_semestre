import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_cc/models/user.dart';

class Users extends ChangeNotifier {
  final Map<String, User> _items = {};
  static const _baseUrl =
      "https://projeto-dart-8cd86-default-rtdb.firebaseio.com/";

  Future<void> put(User user) async {
    if (user == null) {
      return;
    }

    //  if (user.id != null &&
    //       user.id.trim().isNotEmpty &&
    //       _items.containsKey(user.id)) {
    //     _items.update(
    //       user.id,
    //       (_) => User(
    //         id: user.id,
    //         name: user.name,
    //         email: user.email,
    //         avatarUrl: user.avatarUrl,
    //       ),
    //     );
    else {
      final response = await http.post(
        Uri.parse("$_baseUrl/users.json"),
        body: jsonEncode({
          'name': user.name,
          'email': user.email,
          'senha': user.senha,
        }),
      );

      final id = jsonDecode(response.body)['name'];
      print(jsonDecode(response.body));

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          senha: user.senha,
        ),
      );
    }
    notifyListeners();
  }
}
