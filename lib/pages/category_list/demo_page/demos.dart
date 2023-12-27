import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/category_list/component/category_list_item.dart';
import 'package:flutter_gallery/pages/category_list/demo_page/app_bar_demo.dart';

class Demos {
  // Material
  static List<CategoryListItem> materialDemos() {
    return [
      const CategoryListItem(
        title: 'アプリバー',
        subtitle: '現在の画面に関連する情報やアクションを表示します',
        icon: Icons.web_asset,
        widget: AppBarDemo(),
      ),
    ];
  }

  // Cupertino
  static List<CategoryListItem> cupertinoDemos() {
    return [
      const CategoryListItem(
        title: 'アプリバー',
        subtitle: '現在の画面に関連する情報やアクションを表示します',
        icon: Icons.web_asset,
        widget: AppBarDemo(),
      ),
    ];
  }

  // Reference
  static List<CategoryListItem> referenceDemos() {
    return [
      const CategoryListItem(
        title: 'アプリバー',
        subtitle: '現在の画面に関連する情報やアクションを表示します',
        icon: Icons.web_asset,
        widget: AppBarDemo(),
      ),
    ];
  }
}
