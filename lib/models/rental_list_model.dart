import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:otaku_friends/models/rental_model.dart';

import '../network.dart';
import 'item_model.dart';

class RentalListModel extends ChangeNotifier{
  List<RentalModel> _rentalList = [];

  List<RentalModel> get rentalList => _rentalList;

  Future<void> fetchUserRentalList(String apiUrl) async {
    var res = await Network().getData(apiUrl);

    _rentalList = [];
    var body = jsonDecode(res.body);
    body.forEach((rental){
      var item = rental['item'];
      List<String> imageUrlList = [];
      for (var image in item['images']) {
        imageUrlList.add(Network().convertImageUrl(image['image_url']));
      }
      if(imageUrlList.isEmpty){
        imageUrlList.add('https://thumb.ac-illust.com/cf/cf8b964d27b4222926f632cda9ad5eb4_t.jpeg');
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
      RentalModel rentalModel = RentalModel(
        userName: rental['user_name'],
        item: itemModel,
        startDate: DateTime.parse(rental['start_date']),
        endDate: DateTime.parse(rental['end_date']),
        isMatching: rental['is_matching'] == 1 ? true : false
      );
      _rentalList.add(rentalModel);
    });

    notifyListeners();
  }
}