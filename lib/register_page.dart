import 'package:flutter/material.dart';

import 'network.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('新規登録'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            // Columnを使い縦に並べる
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // タイトル
                Text(
                  'オタ友',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ユーザ名'),
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 8),
                // 入力フォーム（メールアドレス）
                TextFormField(
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                // 入力フォーム（パスワード）
                TextFormField(
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width:double.infinity,
                  // ボタン（ログイン）
                  child: ElevatedButton(
                    onPressed: () {
                      final data = {
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'password': _passwordController.text,
                      };
                      setState(() {
                        _isLoading = true;
                      });
                      Network().register(data).then((state){
                        if(state){
                          Navigator.of(context).pop(true);
                        }
                        _isLoading = false;
                      });
                    },
                    child: const Text('登録'),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
