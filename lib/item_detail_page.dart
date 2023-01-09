import 'package:flutter/material.dart';
import 'package:otaku_friends/models/item_model.dart';

class ItemDetailPage extends StatelessWidget{
  final ItemModel item;
  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(item.name),
      ),
      body: Center(
        child:  Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400, height: 400,
                        child: Image.network(
                          item.imageUrlList[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('${item.price}円/日', style: const TextStyle(fontSize: 30)),
                            Text('担保金: ${item.collateral}円', style: const TextStyle(fontSize: 20)),
                            SizedBox(
                              width: double.infinity,
                              child: Text(item.description, textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('借りる', style: TextStyle(fontSize: 20)),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}