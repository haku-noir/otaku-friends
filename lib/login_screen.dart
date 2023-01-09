import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'network.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
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
                        'email': _emailController.text,
                        'password': _passwordController.text,
                      };
                      setState(() {
                        _isLoading = true;
                      });
                      Network().login(data).then((state){
                        if(state){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
                        }
                        _isLoading = false;
                      });
                    },
                    child: const Text('ログイン'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  // ボタン（新規登録）
                  child: ElevatedButton(
                    onPressed: ()=>{},
                    child: const Text('新規登録'),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
