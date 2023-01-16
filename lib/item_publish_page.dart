import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'main_screen.dart';
import 'network.dart';

class ItemPublishPage extends StatefulWidget {
  const ItemPublishPage({super.key});

  @override
  State<ItemPublishPage> createState() => _ItemPublishPageState();
}

class _ItemPublishPageState extends State<ItemPublishPage> {
  bool _isLoading = false;

  File? _image;
  final picker = ImagePicker();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _collateralController = TextEditingController();

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);

    setState(() => _image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> typeList = ['漫画', '小説', 'ブルーレイ', 'CD'];
    return _isLoading ? const Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
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
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '料金'),
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '担保金'),
                    controller: _collateralController,
                    keyboardType: TextInputType.number,
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
                    controller: _descriptionController,
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
                      onPressed: () {
                        final data = {
                          'name': _nameController.text,
                          'price': _priceController.text,
                          'description': _descriptionController.text,
                          'collateral': _collateralController.text
                        };
                        setState(() {
                          _isLoading = true;
                        });
                        Network().postData('/items', data).then((res){
                          if(res.statusCode == 200){
                            var body = json.decode(res.body);
                            return Network().uploadImage('/items/${body['id']}/images', _image);
                          }
                          throw res;
                        }).then((res){
                          if(res.statusCode == 200){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
                          }
                          _isLoading = false;
                        }).catchError((e) => print(e));
                      },
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
