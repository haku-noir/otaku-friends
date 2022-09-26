import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            // Columnを使い縦に並べる
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // タイトル
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 16),
                // 入力フォーム（メールアドレス）
                TextFormField(
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                // 入力フォーム（パスワード）
                TextFormField(
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width:double.infinity,
                  // ボタン（ログイン）
                  child: ElevatedButton(
                    onPressed: ()=>{},
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
