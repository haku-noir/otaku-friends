import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget{
  final String imageURL;
  const ItemDetailPage({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Image.network(imageURL)
    );
  }
}