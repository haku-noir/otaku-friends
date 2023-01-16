import 'package:flutter/material.dart';
import 'package:otaku_friends/rental_list_page.dart';
import 'package:provider/provider.dart';

import 'models/rental_list_model.dart';

class LendItemListPage extends StatelessWidget {
  const LendItemListPage({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => RentalListModel(),
      child: RentalListPage(title: '貸している物一覧', fetchFunction: (BuildContext context){
        Provider.of<RentalListModel>(context, listen: false).fetchUserRentalList('/user/items/rentals');
      },)
    );
  }
}