import 'package:flutter/material.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: const Text('アプリバー'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('1つ目'),
                ),
                const PopupMenuItem(
                  child: Text('2つ目'),
                ),
                const PopupMenuItem(
                  child: Text('2つ目'),
                ),
              ];
            },
          )
        ],
      ),
      body: const Center(
        child: Text('ホーム'),
      ),
    );
  }
}
