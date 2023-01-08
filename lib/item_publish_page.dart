import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ItemPublishPage extends StatefulWidget {
  const ItemPublishPage({super.key});

  @override
  State<ItemPublishPage> createState() => _ItemPublishPageState();
}

class _ItemPublishPageState extends State<ItemPublishPage> {
  File? _image;
  final picker = ImagePicker();

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);

    setState(() => _image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> typeList = ['漫画', '小説', 'ブルーレイ', 'CD'];
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child:  Column(
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
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '説明',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                  ),
                  // DropdownButton(
                  //   hint: const Text('種類'),
                  //   items: typeList.map((String value) {
                  //       return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //       );
                  //     }).toList(),
                  //   onChanged: (String? value)=>{}
                  // ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 300,
                    child: _image != null ? Image.file(_image!) : const Text("写真が選択されていません")
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: const Text('写真を選択'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()=>{},
                      child: const Text('登録'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
