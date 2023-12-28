import 'package:flutter/material.dart';
import 'package:flutter_gallery/data/icons.dart';
import 'package:flutter_gallery/pages/category_list/component/category_list_item.dart';
import 'package:flutter_gallery/pages/category_list/demo_data/demo_pages/app_bar_demo.dart';
import 'package:flutter_gallery/pages/category_list/demo_data/demo_pages/banner_demo.dart';
import 'package:flutter_gallery/pages/category_list/demo_data/demo_pages/bottom_app_bar_demo.dart';

class Demos {
  // Material
  static List<CategoryListItem> materialDemos() {
    return [
      const CategoryListItem(
        title: 'アプリバー',
        subtitle: '現在の画面に関連する情報やアクションを表示します',
        icon: GalleryIcons.appbar,
        widget: AppBarDemo(),
      ),
      const CategoryListItem(
        title: 'バナー',
        subtitle: 'リスト内にバナーを表示します',
        icon: GalleryIcons.listsLeaveBehind,
        widget: BannerDemo(),
      ),
      const CategoryListItem(
        title: 'ボトム アプリバー',
        subtitle: '下部にナビゲーションとアクションが表示されます',
        icon: GalleryIcons.bottomAppBar,
        widget: BottomAppBarDemo(),
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
