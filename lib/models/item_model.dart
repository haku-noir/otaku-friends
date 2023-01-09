class ItemModel{
  final String name, description;
  final int id, userId, price, collateral;
  final List<String> imageUrlList;

  ItemModel({required this.id, required this.userId, required this.name, required this.description, required this.price, required this.collateral, required this.imageUrlList});
}