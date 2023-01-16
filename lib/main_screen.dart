import 'package:flutter/material.dart';
import 'package:otaku_friends/models/item_list_model.dart';
import 'package:otaku_friends/user_information_page.dart';
import 'package:provider/provider.dart';

import 'item_list_page.dart';
import 'item_publish_page.dart';
import 'models/user_model.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  late int _currentIndex;
  late PageController _controller;

  @override
  void initState(){
    super.initState();
    _currentIndex = 0;
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) => _onPageChanged(index),
        children: [
          ChangeNotifierProvider(
            create: (context) => ItemListModel(),
            child: const ItemListPage(),
          ),
          const ItemPublishPage(),
          ChangeNotifierProvider(
            create: (context) => UserModel(),
            child: const UserInformationPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: '借りる'),
          BottomNavigationBarItem(icon: Icon(Icons.outbox), label: '貸す'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'アカウント'),
        ],
        onTap: (int index) => _onTapBottomNavigationItem(index),
        currentIndex: _currentIndex,
      ),
    );
  }

  void _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTapBottomNavigationItem(int index){
    _controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    setState(() {
      _currentIndex = index;
    });
  }
}