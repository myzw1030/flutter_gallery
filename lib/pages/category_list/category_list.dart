import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/category_list/demo/app_bar_demo.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      collapsedBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      shape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
      collapsedShape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white),
      ),
      title: Text(
        'Material',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      leading: Image(
        image: AssetImage(
          'assets/icons/material/material.png',
          package: 'flutter_gallery_assets',
        ),
        width: 30,
      ),
      children: [
        CategoryListItem(
          title: 'アプリバー',
          subtitle: '現在の画面に関連する情報やアクションを表示します',
          icon: Icons.web_asset,
          widget: AppBarDemo(),
        ),
        // GalleryListItem(
        //   title: 'バナー',
        //   subtitle: '現在の画面に関連する情報やアクションを表示します',
        //   icon: Icons.web_asset,
        //   widget: null,
        // ),
        // GalleryListItem(
        //   title: 'ボトムアプリバー',
        //   subtitle: '現在の画面に関連する情報やアクションを表示します',
        //   icon: Icons.web_asset,
        //   widget: null,
        // ),
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.widget,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: Icon(
          icon,
          size: 24,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<double>(
              builder: (context) => widget,
            ),
          );
        },
      ),
    );
  }
}
