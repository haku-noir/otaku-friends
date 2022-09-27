import 'package:flutter/material.dart';
import 'package:otaku_friends/search_bar.dart';

class GoodsListPage extends StatelessWidget {
  const GoodsListPage({super.key});

  @override
  Widget build(BuildContext context){
    final  List<String> imageList = [
      'https://1.bp.blogspot.com/-CbP8p3DSIn0/UchCDw9ebKI/AAAAAAAAVJg/b3woYTn2mVg/s180-c/manga.png',
      'https://2.bp.blogspot.com/-CWoHjphCbNQ/Wj4IYnGuK-I/AAAAAAABJKw/V7xQ7KauTx8S5w0JcEazgmvbS7DOhiQiQCLcBGAs/s400/entertainment_novel.png',
      'https://1.bp.blogspot.com/-rrfJjqUUawc/Wj4IYUjnqtI/AAAAAAABJKo/FIkkDbM7wHgAmqPw1GrRA_3cU-n3Hab3gCLcBGAs/s180-c/entertainment_movie.png',
      'https://2.bp.blogspot.com/-WBB2GvUC_rc/Wj4IYUC_E9I/AAAAAAABJKs/iMcEAHMb9oo8IOx7BqQhWqHt9ef33oLTACLcBGAs/s400/entertainment_music.png',
    ];

    return Scaffold(
      appBar: const SearchBar(),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: imageList.map((String imageURL) {
          return Container(
            color: Colors.grey,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: InkWell(
                onTap: ()=>{},
                child: Image.network(imageURL, fit: BoxFit.cover),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}