import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:otaku_friends/models/item_model.dart';

import '../network.dart';

class ItemListModel extends ChangeNotifier{
  List<ItemModel> _itemList = [];

  List<ItemModel> get itemList => _itemList;

  Future<void> fetchItemList() async {
    var res = await Network().getData('/items');

    _itemList = [];
    var body = jsonDecode(res.body);
    body.forEach((item){
      List<String> imageUrlList = [];
      for (var image in item['images']) {
        imageUrlList.add(image['image_url']);
      }
      ItemModel itemModel = ItemModel(
        id: item['id'],
        userId: item['user_id'],
        name: item['name'],
        description: item['description'],
        price: item['price'],
        collateral: item['collateral'],
        imageUrlList: imageUrlList
      );
      _itemList.add(itemModel);
    });

    notifyListeners();
  }
}