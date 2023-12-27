import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/category_list/component/category_list_item.dart';
import 'package:flutter_gallery/pages/category_list/component/category_tile.dart';
import 'package:flutter_gallery/pages/category_list/demo/app_bar_demo.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryTile(
      title: 'Material',
      image: 'assets/icons/material/material.png',
      children: [
        CategoryListItem(
          title: 'アプリバー',
          subtitle: '現在の画面に関連する情報やアクションを表示します',
          icon: Icons.web_asset,
          widget: AppBarDemo(),
        ),
      ],
    );
  }
}
