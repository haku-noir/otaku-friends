import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../network.dart';

class UserModel extends ChangeNotifier{
  String _name = '', _email = '';

  String get name => _name;
  String get email => _email;

  Future<void> fetchUser() async {
    var res = await Network().getData('/user');

    var body = jsonDecode(res.body);
    _name = body['name'];
    _email = body['email'];

    notifyListeners();
  }
}