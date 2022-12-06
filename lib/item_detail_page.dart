import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget{
  final String imageURL;
  const ItemDetailPage({super.key, required this.imageURL});

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
        title: const Text('映画の来場者特典'),
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
                          imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: const [
                            Text("映画の来場者特典", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("200円/日", style: TextStyle(fontSize: 30)),
                            SizedBox(
                              width: double.infinity,
                              child: Text("〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。〇〇映画の来場者特典です。", textAlign: TextAlign.left),
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