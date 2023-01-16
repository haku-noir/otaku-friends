import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otaku_friends/models/rental_model.dart';
import 'package:provider/provider.dart';

import 'models/rental_list_model.dart';

class RentalListPage extends StatelessWidget {
  final String title;
  final void Function(BuildContext) fetchFunction;
  const RentalListPage({super.key, required this.title, required this.fetchFunction});

  @override
  Widget build(BuildContext context){
    fetchFunction(context);
    return Consumer<RentalListModel>(
      builder: (context, rentalListModel, child){
        List<RentalModel> rentalList = rentalListModel.rentalList;
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(title),
            ),
            body: ListView.builder(
              itemCount: rentalList.length,
              itemBuilder: (BuildContext context, int index) {
                RentalModel rental = rentalList[index];
                return ListTile(
                  leading: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image.network(rental.item.imageUrlList[0], fit: BoxFit.cover),
                  ),
                  title: Text(rental.item.name),
                  subtitle: Text('ユーザ名: ${rental.userName}\n${DateFormat('yyyy/M/d').format(rental.startDate)} 〜 ${DateFormat('yyyy/M/d').format(rental.endDate)}'),
                  isThreeLine: true,
                );
              },
            )
        );
      }
    );
  }
}