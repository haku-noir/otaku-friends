import 'package:otaku_friends/models/item_model.dart';

class RentalModel{
  final String userName;
  final ItemModel item;
  final DateTime startDate, endDate;
  final bool isMatching;

  RentalModel({required this.userName, required this.item, required this.startDate, required this.endDate, required this.isMatching});
}