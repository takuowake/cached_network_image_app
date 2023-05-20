import 'package:flutter/material.dart';

import 'cached_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          // キャッシュから取得するのかネットワークから取得するのか動きを見やすくするために
          // URL毎にキャッシュするのでクエリを付けて40種類のURLにする
          final no = index % 40;
          return Center(
            child: CachedImage(
              url:
              'https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
              name: '${no + 1}',
            ),
          );
        },
        itemCount: 400,
      ),
    );
  }
}