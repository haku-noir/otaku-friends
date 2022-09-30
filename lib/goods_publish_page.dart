import 'package:flutter/material.dart';

class GoodsPublishPage extends StatefulWidget {
  const GoodsPublishPage({super.key});

  @override
  State<GoodsPublishPage> createState() => _GoodsPublishPageState();
}

class _GoodsPublishPageState extends State<GoodsPublishPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> typeList = ['漫画', '小説', 'ブルーレイ', 'CD'];
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  '貸し出す',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: '名前'),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(labelText: '料金'),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                DropdownButton(
                  hint: const Text('種類'),
                  items: typeList.map((String value) {
                      return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                    }).toList(),
                  onChanged: (String? value)=>{}
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width:double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>{},
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
