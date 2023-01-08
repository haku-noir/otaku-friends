import 'package:flutter/material.dart';
import 'package:otaku_friends/login_screen.dart';
import 'package:otaku_friends/main_screen.dart';

import 'network.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Network().checkToken().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen(title: title,)));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen(title: title,)));
      }
    });
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}