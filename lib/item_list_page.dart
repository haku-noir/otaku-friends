import 'package:flutter/material.dart';
import 'package:otaku_friends/search_bar.dart';
import 'package:provider/provider.dart';

import 'item_detail_page.dart';
import 'models/item_list_model.dart';
import 'models/item_model.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context){
    Provider.of<ItemListModel>(context, listen: false).fetchItemList();
    return Consumer<ItemListModel>(
      builder: (context, itemListModel, child){
        List<ItemModel> itemList = itemListModel.itemList;
        return Scaffold(
            appBar: const SearchBar(),
            body: RefreshIndicator(
              onRefresh: () async{
                Provider.of<ItemListModel>(context, listen: false).fetchItemList();
              },
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                children: itemList.map((ItemModel item) {
                  String imageUrl = item.imageUrlList[0];
                  return InkWell(
                    onTap: () =>
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ItemDetailPage(item: item)),
                      )
                    },
                    child: Card(
                      elevation: 3,
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
        );
      }
    );
  }
}