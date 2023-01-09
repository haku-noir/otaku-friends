import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otaku_friends/models/item_model.dart';

class ItemRentalPage extends StatefulWidget{
  final ItemModel item;
  const ItemRentalPage({super.key, required this.item});

  @override
  State<ItemRentalPage> createState() => _ItemRentalPageState();
}

class _ItemRentalPageState extends State<ItemRentalPage> {
  bool _isLoading = false;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

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
        title: Text(widget.item.name),
      ),
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child:  Column(
                children: [
                  Text(
                    '借りる',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 16),
                  Text(widget.item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('${widget.item.price}円/日', style: const TextStyle(fontSize: 30)),
                  Text('担保金: ${widget.item.collateral}円', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 16),
                  Text('${DateFormat('yyyy年M月d日').format(_startDate)} 〜 ${DateFormat('yyyy年M月d日').format(_endDate)}', style: const TextStyle(fontSize: 20)),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    label: const Text('期間を選択'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      final DateTimeRange? range = await showDateRangePicker(
                        context: context,
                        initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
                        firstDate: _startDate,
                        lastDate: DateTime(_startDate.year+1,_startDate.month,_startDate.day),
                      );
                      if(range != null){
                        setState(() {
                        _startDate = range.start;
                        _endDate = range.end;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Text('合計: ${widget.item.price*(_endDate.difference(_startDate).inDays+1)} + ${widget.item.collateral}円', style: const TextStyle(fontSize: 30)),
                  const Text('期限までに返却した場合、担保金は返金されます。'),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('決定'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}