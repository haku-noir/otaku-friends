import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key, required this.title});

  final String title;

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
          Container(
            child: const Center(
              child: Text('ページ: 借りる'),
            ),
          ),
          Container(
            child: const Center(
              child: Text('ページ: 貸す'),
            ),
          ),
          Container(
            child: const Center(
              child: Text('ページ: アカウント'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: '借りる'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: '貸す'),
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