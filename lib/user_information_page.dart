import 'package:flutter/material.dart';
import 'package:otaku_friends/models/user_model.dart';
import 'package:otaku_friends/network.dart';
import 'package:provider/provider.dart';

import 'index_page.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserModel>(context, listen: false).fetchUser();
    return Consumer<UserModel>(
      builder: (context, user, child){
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'ユーザ情報',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 16),
                    Text(
                        '名前: ${user.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'メールアドレス: ${user.email}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          Network().logout().then((_){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const IndexPage()));
                          });
                        },
                        child: const Text('ログアウト'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
